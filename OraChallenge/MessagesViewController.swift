//
//  MessagesViewController.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/30/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import Foundation
import UIKit
import JSQMessagesViewController

class MessagesViewController: JSQMessagesViewController  {
    
    var dataController: DataController?
    var networkConnectController: NetworkConnectController?
    
    var messagesArray = [Message]()
    var avatars = Dictionary<String, UIImage>()
    var outgoingBubbleImageView = JSQMessagesBubbleImageFactory.outgoingMessageBubbleImageViewWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    var incomingBubbleImageView = JSQMessagesBubbleImageFactory.incomingMessageBubbleImageViewWithColor(UIColor.jsq_messageBubbleGreenColor())
    
    func sendMessage(text: String!, sender: String!) {

    }
    
    func tempSendMessage(text: String!, sender: String!) {
//        let message = Message(text: text, sender: sender)
//        messagesArray.append(message)
    }
    
//    func setupAvatarImage(name: String, imageUrl: String?, incoming: Bool) {
//        if let stringUrl = imageUrl {
//            if let url = NSURL(string: stringUrl) {
//                if let data = NSData(contentsOfURL: url) {
//                    let image = UIImage(data: data)
//                    let diameter = incoming ? UInt(collectionView.collectionViewLayout.incomingAvatarViewSize.width) : UInt(collectionView.collectionViewLayout.outgoingAvatarViewSize.width)
//                    let avatarImage = JSQMessagesAvatarFactory.avatarWithImage(image, diameter: diameter)
//                    avatars[name] = avatarImage
//                    return
//                }
//            }
//        }
//        
//        // At some point, we failed at getting the image (probably broken URL), so default to avatarColor
//        setupAvatarColor(name, incoming: incoming)
//    }
    
//    func setupAvatarColor(name: String, incoming: Bool) {
//        let diameter = incoming ? UInt(collectionView.collectionViewLayout.incomingAvatarViewSize.width) : UInt(collectionView.collectionViewLayout.outgoingAvatarViewSize.width)
//        
//        let rgbValue = name.hash
//        let r = CGFloat(Float((rgbValue & 0xFF0000) >> 16)/255.0)
//        let g = CGFloat(Float((rgbValue & 0xFF00) >> 8)/255.0)
//        let b = CGFloat(Float(rgbValue & 0xFF)/255.0)
//        let color = UIColor(red: r, green: g, blue: b, alpha: 0.5)
//        
//        let nameLength = name.characters.count
//        let initials : String? = name.substringToIndex(sender.startIndex.advancedBy(min(3, nameLength)))
//        let userImage = JSQMessagesAvatarFactory.avatarWithUserInitials(initials, backgroundColor: color, textColor: UIColor.blackColor(), font: UIFont.systemFontOfSize(CGFloat(13)), diameter: diameter)
//        
//        avatars[name] = userImage
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesArray = (self.dataController?.messagesArray)!
        self.navigationItem.hidesBackButton = false
        automaticallyScrollsToMostRecentMessage = true
        
//        sender = (sender != nil) ? sender : "Anonymous"
//        let profileImageUrl = user?.providerData["cachedUserProfile"]?["profile_image_url_https"] as? NSString
//        if let urlString = profileImageUrl {
//            setupAvatarImage(sender, imageUrl: urlString as String, incoming: false)
//            senderImageUrl = urlString as String
//        } else {
//            setupAvatarColor(sender, incoming: false)
//            senderImageUrl = ""
//        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView!.collectionViewLayout.springinessEnabled = true
    }
    
    
    func receivedMessagePressed(sender: UIBarButtonItem) {
        // Simulate reciving message
        showTypingIndicator = !showTypingIndicator
        scrollToBottomAnimated(true)
    }
    
    func didPressSendButton(button: UIButton!, withMessageText text: String!, sender: String!, date: NSDate!) {
        
        sendMessage(text, sender: sender)
        finishSendingMessage()
    }
    
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        
        return messagesArray[indexPath.item]
    }
    
    func collectionView(collectionView: JSQMessagesCollectionView!, bubbleImageViewForItemAtIndexPath indexPath: NSIndexPath!) -> UIImageView! {
        let message = messagesArray[indexPath.item]
        
//        if message.sender() == sender {
//            return UIImageView(image: outgoingBubbleImageView.image, highlightedImage: outgoingBubbleImageView.highlightedImage)
//        }
        
        return UIImageView(image: incomingBubbleImageView.image, highlightedImage: incomingBubbleImageView.highlightedImage)
    }
    
    func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageViewForItemAtIndexPath indexPath: NSIndexPath!) -> UIImageView! {
        let message = messagesArray[indexPath.item]
        if let avatar = avatars[message.sender()] {
            return UIImageView(image: avatar)
        } else {
            setupAvatarImage(message.sender(), imageUrl: message.imageUrl(), incoming: true)
            return UIImageView(image:avatars[message.sender()])
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        let message = messagesArray[indexPath.item]
        if message.sender() == sender {
            cell.textView.textColor = UIColor.blackColor()
        } else {
            cell.textView.textColor = UIColor.whiteColor()
        }
        
        let attributes : [String:AnyObject] = [NSForegroundColorAttributeName:cell.textView.textColor!, NSUnderlineStyleAttributeName: 1]
        cell.textView.linkTextAttributes = attributes
        
        //        cell.textView.linkTextAttributes = [NSForegroundColorAttributeName: cell.textView.textColor,
        //            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle]
        return cell
    }
    
    
    // View  usernames above bubbles
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        let message = messagesArray[indexPath.item];
        
        // Sent by me, skip
        if message.sender() == sender {
            return nil;
        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messagesArray[indexPath.item - 1];
            if previousMessage.sender() == message.sender() {
                return nil;
            }
        }
        
        return NSAttributedString(string:message.sender())
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let message = messagesArray[indexPath.item]
        
        // Sent by me, skip
        if message.sender() == sender {
            return CGFloat(0.0);
        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messagesArray[indexPath.item - 1];
            if previousMessage.sender() == message.sender() {
                return CGFloat(0.0);
            }
        }
        
        return kJSQMessagesCollectionViewCellLabelHeightDefault
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

//
//  FirstViewController.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/25/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

class ChatsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var dataController: DataController?
//    var networkConnectController = NetworkConnectController()
    var networkConnectController: NetworkConnectController?
    var window: UIWindow?

    @IBOutlet var chatsTableView: UITableView!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var chatsSearchBar: UISearchBar!
    
    @IBOutlet var backButton: UIBarButtonItem!
    
    var chatsArray = [Chat]()
    var chatCellsArray = [ChatsListCell]()

    var plusButtonYellow: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        
        plusButton.layer.cornerRadius = plusButton.frame.size.width / 2
        plusButtonYellow = plusButton.backgroundColor
        
        chatsArray = dataController!.chatsArray
        
        chatsSearchBar.delegate = self
        self.navigationItem.hidesBackButton = true 
    }
    
    

    @IBAction func plusButtonPressed(sender: AnyObject) {
        
        enterNewChatNameAlert("Enter a New Chat Name", message: "")
    }
    
    
    //MARK: TableView Delegate methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return chatsArray.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderView = UIView()
        sectionHeaderView.frame.size.height = 44
        sectionHeaderView.layer.backgroundColor = UIColor.lightGrayColor().CGColor
        sectionHeaderView.layer.opacity = 0.3
        
        
        
        return sectionHeaderView
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let chatsListCell = ChatsListCell(style: .Default, reuseIdentifier: "ChatListCellID")
        chatsListCell.layoutSubviews()
        return chatsListCell.chatListCellHeight
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        chatCellsArray.removeAll()
        
        let chatsListCell = ChatsListCell(style: .Default, reuseIdentifier: "ChatListCellID")
        chatsListCell.dataController = dataController
        chatsListCell.buttonYellowColor = plusButtonYellow
        chatsListCell.cellIndexPathRow = indexPath.row
        
        var timeAgoString: String = ""
        let currentTimeDate: NSDate!
        
        let dateStr: String = "\(chatsArray[indexPath.section].lastMessageCreatedDate)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let lastMessageTimeDate = dateFormatter.dateFromString(dateStr)
        print("lastMessageTimeDate: \(lastMessageTimeDate)")
        
        let timeSinceLastMessage = NSDate().timeIntervalSinceDate(lastMessageTimeDate!)

        let timeSinceLastAsInt = Int(timeSinceLastMessage)
        let timeInMinutes = timeSinceLastAsInt / 60
        
        print("timeInMinutes: \(timeInMinutes)")
        if timeInMinutes > 60 {
            
            let numberOfHours: Int = timeInMinutes / 60
            print("numberOfHours: \(numberOfHours)")

            if numberOfHours > 24 {
                
                let numberOfDays = numberOfHours / 24
                let numberOfHoursInLastDay = numberOfHours % 24
                print("numberOfDays: \(numberOfDays)")
                print("numberOfHoursInLastDay: \(numberOfHoursInLastDay)")
                timeAgoString = "\(numberOfDays) days \(numberOfHoursInLastDay) hours ago"

            } else {
                
                timeAgoString = "\(numberOfHours) hours ago"
            }
        
        } else {
            
            timeAgoString = "\(timeInMinutes) mins ago"
        }

        chatsListCell.authorTitleHeaderLabel.text = "\(chatsArray[indexPath.section].chatName) by \(chatsArray[indexPath.section].userName)"
        chatsListCell.authorDateLabel.text = "\(chatsArray[indexPath.section].lastMessageUserName) - \(timeAgoString)"
        chatsListCell.lastMessageTextLabel.text = "\(chatsArray[indexPath.section].lastMessageText)"
        
        chatCellsArray.append(chatsListCell)
        return chatsListCell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let chatId = chatsArray[indexPath.section].chatId
        print("chatId: \(chatId)")
        self.dataController!.getAllMessagesForSelectedChat(chatId, completion: { (resultsReturned) in
            
            dispatch_async(dispatch_get_main_queue()) {

                self.performSegueWithIdentifier("showMessagesSegue", sender: nil)

//                if let navigationController = self.window?.rootViewController as? UINavigationController,
//                    let messagesVC = navigationController.viewControllers.last as? MessagesViewController {
//
//                    messagesVC.dataController = self.dataController!
//                    messagesVC.networkConnectController = self.networkConnectController
//                    
//                }
            }
        })
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMessagesSegue" {
            
            if let navigationController = self.window?.rootViewController as? UINavigationController,
                let messagesVC = navigationController.viewControllers.last as? MessagesViewController {
                
                messagesVC.dataController = self.dataController!
                messagesVC.networkConnectController = self.networkConnectController
            }
        }
    }
    
    //MARK: Search Bar Delegate Methods
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {

        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {

        self.dataController!.searchBarBeginSearch(searchBar.text!, completion: {
            (resultsReturned) in
            
            dispatch_async(dispatch_get_main_queue()) {
            
                self.chatsArray = self.dataController!.chatsArray
                self.chatsSearchBar.endEditing(true)
                self.chatsTableView.reloadData()
            }
        })
    }
    
    
    func enterNewChatNameAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) in
            
            let nameTextField: UITextField = (alert.textFields?.first)!
            print("nameTextField.text: \(nameTextField.text)")
            if nameTextField.text != "" {
                
                self.dataController!.createNewChat(nameTextField.text!, completion: { (resultsReturned) in
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        self.chatsArray = self.dataController!.chatsArray
                        self.chatsSearchBar.endEditing(true)
                        self.chatsTableView.reloadData()
                    }
                })
            }
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action:UIAlertAction!) in
            
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        alert.addTextFieldWithConfigurationHandler { (textField) in

        }
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  FirstViewController.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/25/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

class ChatsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataController = DataController()
//    var networkConnectController = NetworkConnectController()
    var networkConnectController: NetworkConnectController?


    @IBOutlet var chatsTableView: UITableView!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var chatsSearchBar: UISearchBar!
    
    var chatsArray = [Chat]()
    var chatCellsArray = [ChatsListCell]()

    var plusButtonYellow: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        
        plusButton.layer.cornerRadius = plusButton.frame.size.width / 2
        plusButtonYellow = plusButton.backgroundColor
        
        chatsArray = networkConnectController!.chatsArray
    }
    
    

    @IBAction func plusButtonPressed(sender: AnyObject) {
        
        
    }
    
    
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

    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


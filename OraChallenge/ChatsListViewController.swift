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
        sectionHeaderView.backgroundColor = UIColor.lightGrayColor()
        
        
        
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
        
        chatsListCell.cellIndexPathRow = indexPath.row
        
        let dateStr: String = "\(chatsArray[indexPath.section].lastMessageCreatedDate)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFromString("\(chatsArray[indexPath.section].lastMessageCreatedDate)")
        
//        let timeAgo
        chatsListCell.authorTitleHeaderLabel.text = "\(chatsArray[indexPath.section].chatName) by \(chatsArray[indexPath.section].userName)"
        chatsListCell.authorDateLabel.text = "\(chatsArray[indexPath.section].lastMessageUserName) - \(dateStr)"
        chatsListCell.lastMessageTextLabel.text = ""
        
        chatCellsArray.append(chatsListCell)
        return chatsListCell

    }

    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


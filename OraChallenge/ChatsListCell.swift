//
//  ChatsListCell.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/29/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

class ChatsListCell: UITableViewCell {
    
    var dataController: DataController?
    var cellIndexPathRow: Int!
    
    var authorTitleHeaderLabel = UILabel()
    var authorDateLabel = UILabel()
    var lastMessageTextLabel = UILabel()
    
    var chatListCellHeight: CGFloat = 0
    var labelsXPos: CGFloat = 0
    var labelsWidth: CGFloat = 0
    var labelsHeight: CGFloat = 25
    
    var topMargin: CGFloat = 10
    var bottomMargin: CGFloat = 20
    var interLabelMargin: CGFloat = 5
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.preservesSuperviewLayoutMargins = false
        labelsXPos = self.contentView.bounds.size.width * 0.05
        labelsWidth = self.contentView.bounds.size.width - labelsXPos
        
        authorTitleHeaderLabel.backgroundColor = UIColor.clearColor()
        authorTitleHeaderLabel.textColor = UIColor.blackColor()
        authorTitleHeaderLabel.textAlignment = .Left
        authorTitleHeaderLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        authorTitleHeaderLabel.adjustsFontSizeToFitWidth = true
        authorTitleHeaderLabel.userInteractionEnabled = false
        self.contentView.addSubview(authorTitleHeaderLabel)
    
        authorDateLabel.backgroundColor = UIColor.clearColor()
        authorDateLabel.textColor = UIColor.yellowColor()
        authorDateLabel.textAlignment = .Left
        authorDateLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        authorDateLabel.adjustsFontSizeToFitWidth = true
        authorDateLabel.userInteractionEnabled = false
        self.contentView.addSubview(authorDateLabel)

        
        lastMessageTextLabel.backgroundColor = UIColor.clearColor()
        lastMessageTextLabel.textColor = UIColor.lightGrayColor()
        lastMessageTextLabel.textAlignment = .Left
        lastMessageTextLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        lastMessageTextLabel.adjustsFontSizeToFitWidth = true
        lastMessageTextLabel.userInteractionEnabled = false
        self.contentView.addSubview(lastMessageTextLabel)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        authorTitleHeaderLabel.frame = CGRectMake(labelsXPos, topMargin, labelsWidth, labelsHeight)
        
        let authorDateLabelYPos = topMargin + labelsHeight + interLabelMargin
        authorDateLabel.frame = CGRectMake(labelsXPos, authorDateLabelYPos, labelsWidth, labelsHeight)
        
        let lastMessageTextLabelYPos = authorDateLabelYPos + labelsHeight + interLabelMargin
        lastMessageTextLabel.frame = CGRectMake(labelsXPos, lastMessageTextLabelYPos, labelsWidth, labelsHeight)
        
        chatListCellHeight = lastMessageTextLabelYPos + labelsHeight + bottomMargin
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

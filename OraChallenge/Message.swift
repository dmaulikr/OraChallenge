//
//  Message.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/29/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import Foundation
import JSQMessagesViewController

class Message: NSObject {
    
    var messageId: Int!
    var chatId: Int!
    var userId: Int!
    var messageText: String!
    var messageCreatedDate: String!
    var messageSenderDataDict: NSDictionary!
    var messageSenderUserName: String!
    
    
    init(messageId: Int, chatId: Int, userId: Int, messageText: String, messageCreatedDate: String, messageSenderUserName: String) {

        self.messageId = messageId
        self.chatId = chatId
        self.userId = userId
        self.messageText = messageText
        self.messageCreatedDate = messageCreatedDate
        self.messageSenderUserName = messageSenderUserName
        
        self.messageSenderDataDict = ["id": userId, "name": messageSenderUserName]
    }
    
}

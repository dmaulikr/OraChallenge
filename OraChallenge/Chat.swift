//
//  Chat.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/29/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import Foundation

class Chat: NSObject {
    
    var chatId: Int!
    var userId: Int!
    var chatName: String!
    var chatCreatedDate: String!
    var userDataDict: NSDictionary!
    var userName: String!
    var lastMessageId: Int!
    var lastMessageUserId: Int!
    var lastMessageText: String!
    var lastMessageCreatedDate: String!
    var lastMessageUserName: String!
    
    init(chatId: Int, userId: Int, chatName: String, chatCreationDate: String, userName: String, lastMessageId: Int, lastMessageUserId: Int, lastMessageText: String, lastMessageCreatedDate: String, lastMessageUserName: String) {
        
        self.chatId = chatId
        self.userId = userId
        self.chatName = chatName
        self.chatCreatedDate = chatCreationDate
        self.userName = userName
        self.lastMessageId = lastMessageId
        self.lastMessageUserId = lastMessageUserId
        self.lastMessageText = lastMessageText
        self.lastMessageCreatedDate = lastMessageCreatedDate
        self.lastMessageUserName = lastMessageUserName
        
        self.userDataDict = ["id": userId, "name": userName]
    }
    
    
    
    
    
    
    
    
}
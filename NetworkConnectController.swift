//
//  NetworkConnectController.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/28/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import Foundation

class NetworkConnectController {
    
    var baseUrl: String = "http://private-d9e5b-oracodechallenge.apiary-mock.com"

    func loginUser(email: String, password: String) {
        
        let loginUrl = baseUrl.stringByAppendingString("/users/login")
        print("loginUrl: \(loginUrl)")
        let url:NSURL = NSURL(string: loginUrl)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        var postData: NSData!
//        let loginDict = ["email": "andre@orainteractive.com", "password": "test123"]
        let loginDict = ["email": email, "password": password]

        do {
//            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(loginDict, options: .PrettyPrinted)
            postData = try NSJSONSerialization.dataWithJSONObject(loginDict, options: .PrettyPrinted)
            
        } catch let error {
            print("error: \(error)")
        }
        
//        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
        let dataTask = session.uploadTaskWithRequest(request, fromData: postData) { (data, response, error) in
        
            print("response: \(response)")
            let statusCode = (response as? NSHTTPURLResponse)?.statusCode
            print("statusCode: \(statusCode)")
            if statusCode == 200 {
                do {
                    print("data: \(data)")
                    if data != nil{
                        let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                        
                        print("dict: \(dict)")
                        
                        let tokenInResponseDict = dict.objectForKey("data")?.objectForKey("token") as! String
                    }
                    
                } catch {
                    
                    print("Error")
                }
            }
        }
        
        dataTask.resume()
    }
    
    

    func registerNewUser(name: String, email: String, password: String, confirm: String) {
        
        let registerUrl = baseUrl.stringByAppendingString("/users/register")
        print("registerUrl: \(registerUrl)")
        let url:NSURL = NSURL(string: registerUrl)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        var postData: NSData!
        //        let loginDict = ["email": "andre@orainteractive.com", "password": "test123"]
        let registerDict = ["name": name, "email": email, "password": password, "confirm": confirm]
        
        do {
            //            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(loginDict, options: .PrettyPrinted)
            postData = try NSJSONSerialization.dataWithJSONObject(registerDict, options: .PrettyPrinted)
            
        } catch let error {
            print("error: \(error)")
        }
        
        //        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
        let dataTask = session.uploadTaskWithRequest(request, fromData: postData) { (data, response, error) in
            
            print("response: \(response)")
            let statusCode = (response as? NSHTTPURLResponse)?.statusCode
            print("statusCode: \(statusCode)")
            if statusCode == 201 {
                do {
                    print("data: \(data)")
                    if data != nil{
                        let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                        
                        print("dict: \(dict)")
                        
                        let tokenInResponseDict = dict.objectForKey("data")?.objectForKey("token") as! String
                    }
                    
                } catch {
                    
                    print("Error")
                }
            }
        }
        
        dataTask.resume()
    }

    
    func getAllUsersChat(searchQueryString: String, page: String, limit: NSNumber, completion: ((chatsArray: [Chat]?) -> Void)) {
        
        var chatsArray = [Chat]()
        
        let getChatsUrl = baseUrl.stringByAppendingString("/chats?q=\(searchQueryString)&page=\(page)&limit=\(limit)")
        print("getChatsUrl: \(getChatsUrl)")
        let url:NSURL = NSURL(string: getChatsUrl)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
    
            print("response: \(response)")
            let statusCode = (response as? NSHTTPURLResponse)?.statusCode
            print("statusCode: \(statusCode)")
            if statusCode == 200 {
                do {
                    print("data: \(data)")
                    if data != nil{
                        let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                        
                        print("dict: \(dict)")
                        let dataArray = dict.objectForKey("data") as! NSArray
                        print("dataArray: \(dataArray)")
                        var startingInt = 0
                        let dataArrayCount = dataArray.count
//                        return chatsArray
                        
                        while startingInt < dataArrayCount {
                            
                            let chatId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("id") as! Int
                            let userId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user_id") as! Int
                            let chatName = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("name") as! String
                            let chatCreatedDate = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("created") as! String
                            let userName = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user") as! NSDictionary).objectForKey("name") as! String
                            let lastMessageId = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("id") as! Int
                            let lastMessageUserId = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("user_id") as! Int
                            let lastMessageText = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("message") as! String
                            let lastMessageCreatedDate = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("created") as! String
                            let lastMessageUserName = (((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("user") as! NSDictionary).objectForKey("name") as! String
                            
                            print("chatId: \(chatId)")
                            print("lastMessageUserName: \(lastMessageUserName)")
                            
                            let chat = Chat(chatId: chatId, userId: userId, chatName: chatName, chatCreationDate: chatCreatedDate, userName: userName, lastMessageId: lastMessageId, lastMessageUserId: lastMessageUserId, lastMessageText: lastMessageText, lastMessageCreatedDate: lastMessageCreatedDate, lastMessageUserName: lastMessageUserName)
                            
                            chatsArray.append(chat)
                            startingInt += 1
                        }
                        
                        print("chatsArray.count: \(chatsArray.count)")
                        completion(chatsArray: chatsArray)
                    }
                    
                } catch {
                    
                    print("Error")
                }
            }
        })
        
        dataTask.resume()
    }
    
    
    
    func searchChatsWithString(searchQueryString: String, page: String, limit: NSNumber, completion: ((chatsArray: [Chat]?) -> Void)) {
        
        var chatsArray = [Chat]()
        
        let getChatsUrl = baseUrl.stringByAppendingString("/chats?q=\(searchQueryString)&page=\(page)&limit=\(limit)")
        print("getChatsUrl: \(getChatsUrl)")
        let url:NSURL = NSURL(string: getChatsUrl)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            
            print("response: \(response)")
            let statusCode = (response as? NSHTTPURLResponse)?.statusCode
            print("statusCode: \(statusCode)")
            if statusCode == 200 {
                do {
                    print("data: \(data)")
                    if data != nil{
                        let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                        
                        print("dict: \(dict)")
                        let dataArray = dict.objectForKey("data") as! NSArray
                        print("dataArray: \(dataArray)")
                        var startingInt = 0
                        let dataArrayCount = dataArray.count
                        //                        return chatsArray
                        
                        while startingInt < dataArrayCount {
                            
                            let chatId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("id") as! Int
                            let userId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user_id") as! Int
                            let chatName = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("name") as! String
                            let chatCreatedDate = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("created") as! String
                            let userName = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user") as! NSDictionary).objectForKey("name") as! String
                            let lastMessageId = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("id") as! Int
                            let lastMessageUserId = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("user_id") as! Int
                            let lastMessageText = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("message") as! String
                            let lastMessageCreatedDate = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("created") as! String
                            let lastMessageUserName = (((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("user") as! NSDictionary).objectForKey("name") as! String
                            
                            print("chatId: \(chatId)")
                            print("lastMessageUserName: \(lastMessageUserName)")
                            
                            let chat = Chat(chatId: chatId, userId: userId, chatName: chatName, chatCreationDate: chatCreatedDate, userName: userName, lastMessageId: lastMessageId, lastMessageUserId: lastMessageUserId, lastMessageText: lastMessageText, lastMessageCreatedDate: lastMessageCreatedDate, lastMessageUserName: lastMessageUserName)
                            
                            chatsArray.append(chat)
                            startingInt += 1
                        }
                        
                        print("chatsArray.count: \(chatsArray.count)")
                        completion(chatsArray: chatsArray)
                    }
                    
                } catch {
                    
                    print("Error")
                }
            }
        })
        
        dataTask.resume()
    }
    
    
    func createNewChatWithName(newChatName: String, completion: ((chatsArray: [Chat]?) -> Void)) {
        
        var chatsArray = [Chat]()
        
        let createNewChatUrl = baseUrl.stringByAppendingString("/chats)")
        let url:NSURL = NSURL(string: createNewChatUrl)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        var postData: NSData!
        
        let chatNameDict = ["name": "A Chat"]
        
        do {
            
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(chatNameDict, options: .PrettyPrinted)
//            postData = try NSJSONSerialization.dataWithJSONObject(chatNameDict, options: .PrettyPrinted)
            
        } catch let error {
            print("error: \(error)")
        }
        
        //        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
        let dataTask = session.uploadTaskWithRequest(request, fromData: postData) { (data, response, error) in
            
            let statusCode = (response as? NSHTTPURLResponse)?.statusCode
            print("response: \(response.debugDescription)")
            if statusCode == 201 {
                do {
                    if data != nil{
                        let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                        
                        print("dict: \(dict)")
//                        let dataArray = dict.objectForKey("data") as! NSArray
//                        print("dataArray: \(dataArray)")
//                        var startingInt = 0
//                        let dataArrayCount = dataArray.count
                        
//                        while startingInt < dataArrayCount {
//                            
//                            let chatId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("id") as! Int
//                            let userId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user_id") as! Int
//                            let chatName = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("name") as! String
//                            let chatCreatedDate = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("created") as! String
//                            let userName = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user") as! NSDictionary).objectForKey("name") as! String
//                            let lastMessageId = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("id") as! Int
//                            let lastMessageUserId = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("user_id") as! Int
//                            let lastMessageText = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("message") as! String
//                            let lastMessageCreatedDate = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("created") as! String
//                            let lastMessageUserName = (((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("last_message") as! NSDictionary).objectForKey("user") as! NSDictionary).objectForKey("name") as! String
//                            
//                            print("chatId: \(chatId)")
//                            print("lastMessageUserName: \(lastMessageUserName)")
//                            
//                            let chat = Chat(chatId: chatId, userId: userId, chatName: chatName, chatCreationDate: chatCreatedDate, userName: userName, lastMessageId: lastMessageId, lastMessageUserId: lastMessageUserId, lastMessageText: lastMessageText, lastMessageCreatedDate: lastMessageCreatedDate, lastMessageUserName: lastMessageUserName)
//                            
//                            chatsArray.append(chat)
//                            startingInt += 1
//                        }
                        
//                        print("chatsArray.count: \(chatsArray.count)")
                        completion(chatsArray: chatsArray)
                    }
                    
                } catch {
                    
                    print("Error")
                }
            }
        }
        
        dataTask.resume()
    }
    
    
    
    
    
    func getMessagesForSelectedChat(chatId: NSNumber, page: String, limit: NSNumber, completion: ((messagesArray: [Message]?) -> Void)) {
        
        var messagesArray = [Message]()
        
        let getMessagesUrl = baseUrl.stringByAppendingString("/chats/\(chatId)/messages?page=\(page)&limit=\(20)")
        let url:NSURL = NSURL(string: getMessagesUrl)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            
            print("response: \(response)")
            let statusCode = (response as? NSHTTPURLResponse)?.statusCode
            print("statusCode: \(statusCode)")
            if statusCode == 200 {
                do {
                    print("data: \(data)")
                    if data != nil{
                        let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                        
                        print("dict: \(dict)")
                        let dataArray = dict.objectForKey("data") as! NSArray
                        print("dataArray: \(dataArray)")
                        var startingInt = 0
                        let dataArrayCount = dataArray.count
                        //                        return chatsArray
                        
                        while startingInt < dataArrayCount {
          
                            let messageId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("id") as! Int
                            let chatId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("chat_id") as! Int
                            let userId = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user_id") as! Int
                            let messageText = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("message") as! String
                            let messageCreatedDate = (dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("created") as! String
                            let messageSenderUserName = ((dataArray.objectAtIndex(startingInt) as! NSDictionary).objectForKey("user") as! NSDictionary).objectForKey("name") as! String
                            
                            print("messageId: \(messageId)")
                            print("messageSenderUserName: \(messageSenderUserName)")
                            
                            let message = Message(messageId: messageId, chatId: chatId, userId: userId, messageText: messageText, messageCreatedDate: messageCreatedDate, messageSenderUserName: messageSenderUserName)
                            
                            messagesArray.append(message)
                            startingInt += 1
                        }
                        
                        print("chatsArray.count: \(messagesArray.count)")
                        completion(messagesArray: messagesArray)
                    }
                    
                } catch {
                    
                    print("Error")
                }
            }
        })
        
        dataTask.resume()
    }

    
    
    

}
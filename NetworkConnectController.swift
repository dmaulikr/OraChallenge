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

}
//
//  DataController.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/28/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import Foundation
import UIKit

class DataController {

    var name: String!
    var email: String?
    var password: String!
    var confirmPassword: String!
    
    var emailIsValid: Bool!
    
    func loginTextFieldUpdated(textField: String, updatedText: String) {
        
        if textField == "email" {
            
            email = updatedText
            
        } else if textField == "password" {
            
            password = updatedText
        }
    }
    
    
    func loginFieldsAreComplete() -> Bool {
        
        if email != nil && email != "" {
            
            if isValidEmail(email!) {
                
                emailIsValid = true
            }
            
            if password != nil && password != "" {
                
                return true
                
            } else {
                
                return false
            }
            
        } else {
            
            return false
        }
    }
    
    
    func registrationTextFieldUpdated(textField: String, updatedText: String) {
        
        if textField == "name" {
            
            name = updatedText
            
        } else if textField == "email" {
            
            email = updatedText
            
        } else if textField == "password" {
            
            password = updatedText
            
        } else if textField == "confirm" {
            
            confirmPassword = updatedText
        }
    }
    
    
    func registrationFieldsAreComplete() -> Bool {
        
        if name != nil && name != "" {
            
            if email != nil && email != "" {
                
                if isValidEmail(email!) {
                    
                    emailIsValid = true
                }
                
                if password != nil && password != "" {
                    
                    if confirmPassword != nil && confirmPassword != "" {
                    
                        return true
                        
                    } else {
                        return false
                    }
                    
                } else {
                    return false
                }
                
            } else {
                return false
            }
            
        } else {
            return false
        }
    }
    
    
    func passwordsMatch() -> Bool {
        
        if password != nil && password != "" {
            
            if confirmPassword != nil && confirmPassword != "" {
                
                if password == confirmPassword {
                    
                    return true
                    
                } else {
                    return false
                }
                
            } else {
                return false
            }
            
        } else {
            return false
        }
    }
    
    
    
    func isValidEmail(stringValue: String) ->Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(stringValue)
    }
}
//
//  RegistrationCells.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/26/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

class AccountNRegistrationCells: UITableViewCell, UITextFieldDelegate {
    
    var dataController: DataController?

    var namePlaceholderString:String = "Name"
    var emailPlaceholderString:String = "Email"
    var passwordPlaceHolderString:String = "Password"
    var confirmPasswordPlaceHolderString:String = "Confirm"

    var cellIndexPathRow: Int!
    
    var textField = UITextField()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.preservesSuperviewLayoutMargins = false
        
        textField.backgroundColor = UIColor.clearColor()
        textField.textColor = UIColor.blackColor()
        textField.textAlignment = .Left
        textField.font = UIFont(name: "HelveticaNeue", size: 17.0)
        textField.adjustsFontSizeToFitWidth = true
        textField.userInteractionEnabled = true
        textField.delegate = self
        self.contentView.addSubview(textField)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textField.frame = CGRectMake(10, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height)
        
        self.separatorInset = UIEdgeInsetsMake(0, self.contentView.bounds.size.width * 0.025, 0, 0)
        
        if cellIndexPathRow == 0 {
            
            textField.text = namePlaceholderString
            
        } else if cellIndexPathRow == 1 {
            
            textField.text = emailPlaceholderString
            textField.keyboardType = .EmailAddress
            
        } else if cellIndexPathRow == 2 {
            
            textField.text = passwordPlaceHolderString
            
        } else if cellIndexPathRow == 3 {
            
            textField.text = confirmPasswordPlaceHolderString
        }
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if cellIndexPathRow == 0 && textField.text == namePlaceholderString {
            
            textField.text = ""
            
        } else if cellIndexPathRow == 1 && textField.text == emailPlaceholderString{
            
            textField.text = ""
            
        } else if cellIndexPathRow == 2 && textField.text == passwordPlaceHolderString {
            
            textField.text = ""
            textField.secureTextEntry = true
            
        } else if cellIndexPathRow == 3 && textField.text == confirmPasswordPlaceHolderString {
            
            textField.text = ""
            textField.secureTextEntry = true
        }
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if cellIndexPathRow == 0 && textField.text == "" {
            
            textField.placeholder = emailPlaceholderString
            
        } else if cellIndexPathRow == 0 && textField.text != "" {
            
            dataController?.registrationTextFieldUpdated("name", updatedText: textField.text!)
            
        } else if cellIndexPathRow == 1 && textField.text == "" {
            
            textField.placeholder = passwordPlaceHolderString
            
        } else if cellIndexPathRow == 1 && textField.text != "" {
            
            dataController?.registrationTextFieldUpdated("email", updatedText: textField.text!)
            
        }else if cellIndexPathRow == 2 && textField.text == "" {
            
            textField.secureTextEntry = false
            textField.placeholder = passwordPlaceHolderString
            
        } else if cellIndexPathRow == 2 && textField.text != "" {
            
            dataController?.registrationTextFieldUpdated("password", updatedText: textField.text!)
            
        }else if cellIndexPathRow == 3 && textField.text == "" {
            
            textField.secureTextEntry = false
            textField.placeholder = passwordPlaceHolderString
            
        } else if cellIndexPathRow == 3 && textField.text != "" {
            
            dataController?.registrationTextFieldUpdated("confirm", updatedText: textField.text!)
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField.isFirstResponder() {
            
            textField.endEditing(true)
        }
        return true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

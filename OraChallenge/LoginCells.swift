//
//  LoginCells.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/26/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

protocol LoginCellsDelegate {
    
    func loginCellsTextFieldDidEndEditing(sender: LoginCells, finalText: String, indexPathRowOfCell: Int)
}
class LoginCells: UITableViewCell, UITextFieldDelegate{

    var delegate: LoginCellsDelegate?
    
    var label = UILabel()
    var textField = UITextField()
    var emailPlaceholderString:String = "Your Email"
    var passwordPlaceHolderString:String = "Your Password"
    var cellIndexPathRow: Int!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.preservesSuperviewLayoutMargins = false
        
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.font = UIFont(name: "HelveticaNeue", size: 17.0)
        label.adjustsFontSizeToFitWidth = true
        label.userInteractionEnabled = false
        self.contentView.addSubview(label)
        
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

        label.frame = CGRectMake(0, 0, self.contentView.bounds.size.width * 0.275, self.contentView.bounds.size.height)

        let textFieldXPos = label.frame.size.width
        let textFieldWidth = self.contentView.bounds.size.width - textFieldXPos
        textField.frame = CGRectMake(textFieldXPos, 0, textFieldWidth, self.contentView.bounds.size.height)
        
        self.separatorInset = UIEdgeInsetsMake(0, self.contentView.bounds.size.width * 0.05, 0, 0)
//        self.layoutMargins = UIEdgeInsetsZero
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField.text == textField.placeholder {
            
            textField.text = ""
        }
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if cellIndexPathRow == 0 && textField.text == "" {
            
            textField.placeholder = emailPlaceholderString
            
        } else if cellIndexPathRow == 0 && textField.text != "" {
        
            delegate?.loginCellsTextFieldDidEndEditing(self, finalText: textField.text!, indexPathRowOfCell: 0)
            
        } else if cellIndexPathRow == 1 && textField.text == "" {
            
            textField.placeholder = passwordPlaceHolderString
            
        } else if cellIndexPathRow == 1 && textField.text != "" {
            
            delegate?.loginCellsTextFieldDidEndEditing(self, finalText: textField.text!, indexPathRowOfCell: 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

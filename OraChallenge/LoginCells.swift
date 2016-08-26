//
//  LoginCells.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/26/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

class LoginCells: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.preservesSuperviewLayoutMargins = false

    }

    
    override func layoutSubviews() {
        super.layoutSubviews()

//        self.separatorInset = UIEdgeInsets(top: 0, left: screenSize.width * 0.05, bottom: 0, right: screenSize.width * 0.05)
        self.layoutMargins = UIEdgeInsetsZero
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

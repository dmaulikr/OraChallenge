//
//  RegistrationTableView.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/26/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

class RegistrationTableView: UITableView {

    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.registerClass(RegistrationCells.self, forCellReuseIdentifier: "regCellID")
        self.scrollEnabled = false
        self.allowsSelection = false
        self.showsVerticalScrollIndicator = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

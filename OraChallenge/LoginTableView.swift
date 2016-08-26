//
//  LoginTableView.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/26/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import UIKit

protocol LoginTableViewDelegate {
    
    
}



class LoginTableView: UITableView {

        var loginCellsArray = [LoginCells]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.registerClass(LoginCells.self, forCellReuseIdentifier: "loginCellID")
        self.scrollEnabled = false
        self.allowsSelection = false
        
        
        let firstLoginCell = LoginCells(style: .Default, reuseIdentifier: "loginCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

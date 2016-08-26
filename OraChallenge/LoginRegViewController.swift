//
//  LoginRegViewController.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/25/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import Foundation
import UIKit

class LoginRegViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var presentedTableView: UITableView!
    var loginTableV: LoginTableView!
    var registrationTableV: RegistrationTableView!
    
    @IBOutlet var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet var rightBarButtonItem: UIBarButtonItem!
    
    var loginCellsArray = [LoginCells]()
    var registrationCellsArray = [RegistrationCells]()
    
    var isShowingLoginTV: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isShowingLoginTV = true
        leftBarButtonItem.title = "Register"

        loginTableV = LoginTableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), style: .Plain)
//        loginCellsArray = loginTableV.
        registrationTableV = RegistrationTableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), style: .Plain)
        
        presentedTableView = loginTableV
        presentedTableView.dataSource = self
        presentedTableView.delegate = self
        
        self.view.addSubview(presentedTableView)
    }
    
    
    //MARK: UINavigationItem BarButtonItem Pressed methods
    @IBAction func leftBarButtonPressed(sender: AnyObject) {
        
        if isShowingLoginTV == true {
            
            isShowingLoginTV = false
            presentedTableView.removeFromSuperview()
            presentedTableView = registrationTableV
            self.view.addSubview(presentedTableView)
            leftBarButtonItem.title = "Login"
            rightBarButtonItem.title = "Register"
            
        } else {
            
            isShowingLoginTV = true
            presentedTableView.removeFromSuperview()
            presentedTableView = loginTableV
            self.view.addSubview(presentedTableView)
            leftBarButtonItem.title = "Register"
            rightBarButtonItem.title = "Login"
        }
    }
    

    @IBAction func rightBarButtonPressed(sender: AnyObject) {
        
        
    }
    
    
    //MARK: UITableView methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isShowingLoginTV == true {
            
            return 2
            
        } else {
            
            return 4
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if isShowingLoginTV == true {
            
            return 2
            
        } else {
            
            return 4
        }
    }
    
    
    
    
    
}
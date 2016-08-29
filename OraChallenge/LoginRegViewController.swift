//
//  LoginRegViewController.swift
//  OraChallenge
//
//  Created by Daniel Hahm on 8/25/16.
//  Copyright © 2016 DanH. All rights reserved.
//

import Foundation
import UIKit

class LoginRegViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataController: DataController?
    
    var tableView: UITableView!
    var isShowingLoginTV: Bool!
    
    @IBOutlet var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet var rightBarButtonItem: UIBarButtonItem!
    
    var loginCellsArray = [LoginCells]()
    var accountNRegCellsArray = [AccountNRegistrationCells]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isShowingLoginTV = true
        leftBarButtonItem.title = "Register"

        tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), style: .Plain)
        tableView.registerClass(LoginCells.self, forCellReuseIdentifier: "loginCellID")
        tableView.registerClass(AccountNRegistrationCells.self, forCellReuseIdentifier: "accountNRegCellID")
        tableView.scrollEnabled = false
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self 
        
        self.view.addSubview(tableView)
    }
    
    
    //MARK: UINavigationItem BarButtonItem Pressed methods
    @IBAction func leftBarButtonPressed(sender: AnyObject) {
        
        if isShowingLoginTV == true {
            
            isShowingLoginTV = false
            
            leftBarButtonItem.title = "Login"
            rightBarButtonItem.title = "Register"
            
            tableView.reloadData()
            
        } else {
            
            isShowingLoginTV = true
            
            leftBarButtonItem.title = "Register"
            rightBarButtonItem.title = "Login"
            
            tableView.reloadData()
        }
    }
    
    @IBAction func rightNavBarButtonPressed(sender: AnyObject) {
        
        for loginCell in loginCellsArray {
            
            if loginCell.textField.isFirstResponder() {
                
                loginCell.textField.endEditing(true)
            }
        }
        
        for accountNRegCell in accountNRegCellsArray {
            
            if accountNRegCell.textField.isFirstResponder() {
                
                accountNRegCell.textField.endEditing(true)
            }
        }
        
        if isShowingLoginTV == true {
            
            if dataController?.loginFieldsAreComplete() == true {
                
                if dataController?.emailIsValid == true {
                    
                    dataController?.tryToLoginWithCredentials()
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let tabBarVC = storyboard.instantiateViewControllerWithIdentifier("tabBarCont") as? UITabBarController {
                        presentViewController(tabBarVC, animated: true, completion: nil)
                    }
                    print("check against API and segue to main chat view controller")

                } else {
                    
                    showIncompleteAlert("Please make sure you've entered the email address correctly", message: "")
                }
                
            } else {
                
                showIncompleteAlert("Please compete all fields before attempting to Log In", message: "")
            }
            
        } else {
            
            if dataController?.registrationFieldsAreComplete() == true {
                
                if dataController?.emailIsValid == true {
                    
                    if dataController?.passwordsMatch() == true {
                        
                        dataController!.registerNewUser()
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        if let tabBarVC = storyboard.instantiateViewControllerWithIdentifier("tabBarCont") as? UITabBarController {
                            presentViewController(tabBarVC, animated: true, completion: nil)
                        }
                        print("check against API and segue to main chat view controller")
                        
                    } else {
                        
                        showIncompleteAlert("Please make sure the passwords are matching and try to Register again", message: "")
                    }
                    
                } else {
                    
                    showIncompleteAlert("Please make sure you've entered the email address correctly", message: "")
                }
                
            } else {
                
                showIncompleteAlert("Please compete all fields before attempting to Register", message: "")
            }
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isShowingLoginTV == true {
            
            return 2
            
        } else {
            
            return 4
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let accountNRegistrationCells = AccountNRegistrationCells(style: .Default, reuseIdentifier: "accountNRegCellID")
        accountNRegistrationCells.dataController = dataController
        
        let loginCell = LoginCells(style: .Default, reuseIdentifier: "loginCellID")
        loginCell.dataController = dataController   

        if isShowingLoginTV == true {
            
            loginCell.cellIndexPathRow = indexPath.row
            loginCellsArray.append(loginCell)
            return loginCell
            
        } else {
            
            accountNRegistrationCells.cellIndexPathRow = indexPath.row
            accountNRegCellsArray.append(accountNRegistrationCells)
            return accountNRegistrationCells
        }
    }

    
    func showIncompleteAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) in
            
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        presentViewController(alert, animated: true, completion: nil)
    }


}
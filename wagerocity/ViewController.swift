//
//  ViewController.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 10/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Alamofire

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.readPermissions = ["public_profile", "email"]
        loginButton.delegate = self
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            returnUserData()
        }
        else {
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                returnUserData()
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    func returnUserData() {
        Utils.showLoader()
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil) {
                
                println("Error: \(error)")
                
            } else {
                
                let userName : NSString = result.valueForKey("name") as! NSString
                let userEmail : NSString = result.valueForKey("email") as! NSString
                
                let id : AnyObject? = result.valueForKey("id")
                
                ServiceModel.createUser(
                    id as! String,
                    firstName: result.valueForKey("first_name") as! String,
                    lastName: result.valueForKey("last_name") as! String,
                    email: result.valueForKey("email") as! String,
                    completion: { (request, response, body, error, statusCode) -> Void in
                        
                        if statusCode == 200 {
                            
                            Utils.saveUserObject(body!)
                            self.performSegueWithIdentifier(Constants.Segue.Dashboard, sender: nil)
                            
                        } else {
                            
                            ServiceModel.getUser(id as! String, completion: { (request, response, body, error, statusCode) -> Void in
                                if statusCode == 200 {
                                    self.performSegueWithIdentifier(Constants.Segue.Dashboard, sender: nil)
                                } else {
                                    UIAlertView(title: "Error!", message: String(format:"%@", body as! NSDictionary), delegate: nil, cancelButtonTitle: "ok")
                                }
                            })
                        }
                })
            }
        })
    }
    
}


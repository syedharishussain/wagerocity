//
//  DashboardViewController.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 11/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: BaseViewController {
    
    @IBOutlet weak var bettingPortalButton: UIButton!
    @IBOutlet weak var poolsButton: UIButton!
    @IBOutlet weak var myPicksButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    @IBOutlet weak var expertsButton: UIButton!
    @IBOutlet weak var getDollarsButton: UIButton!
    @IBOutlet weak var clearBalanceButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.hidden = false
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
    @IBAction func bettingPortal(sender: AnyObject) {
        self.performSegueWithIdentifier(Constants.Segue.SportsList, sender: nil)
    }
    
    @IBAction func pools(sender: AnyObject) {
    }
    
    @IBAction func myPicks(sender: AnyObject) {
    }
    
    @IBAction func leaderboards(sender: AnyObject) {
        self.performSegueWithIdentifier(Constants.Segue.SportsList, sender: nil)
    }
    
    @IBAction func experts(sender: AnyObject) {
    }
    
    @IBAction func getDollars(sender: AnyObject) {
        [self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier(Constants.ViewController.GetDollars) as! UIViewController, animated: true)]
    }

    @IBAction func clearBalance(sender: AnyObject) {
    }
    
    @IBAction func settings(sender: AnyObject) {
    }
    
}
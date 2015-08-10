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
        self.performSegueWithIdentifier(Constants.Segue.SportsList, sender: Bool(false))
    }
    
    @IBAction func pools(sender: AnyObject) {
        ServiceModel.getPools { (request, responseObject, anyObject, error, statusCode) -> Void in
            if statusCode == 200 {
                self.performSegueWithIdentifier(Constants.Segue.Pools, sender: anyObject as! Array<AnyObject>)
            } else {
                Utils.showMessage(self, message: "There are currently no pools available!")
            }
        }
    }
    
    @IBAction func myPicks(sender: AnyObject) {
        ServiceModel.getMyPicks { (body, error, statusCode:Int) -> Void in
            if let err = error as NSError? {
                println(err)
                Utils.showError(err)
                return
            }
            
            if statusCode == 200 {
                var array = body as! NSArray
                
//                array = array.filteredArrayUsingPredicate(NSPredicate(block: { (object , _) -> Bool in
//                    let dic : NSDictionary = object as! NSDictionary
//                    return (dic["odd_info"] as! NSArray).count > 0
//                }))
                
                array = array.sortedArrayUsingDescriptors([NSSortDescriptor(key: "bet_id", ascending: false)])
                
                if array.count > 0 {
                    
                }
                self.performSegueWithIdentifier(Constants.Segue.MyPicks, sender: array)
            } else {
                Utils.showMessage(self, message: "There are currently no picks!")
            }
        }
    }
    
    @IBAction func leaderboards(sender: AnyObject) {
        self.performSegueWithIdentifier(Constants.Segue.SportsList, sender:Bool(true))
    }
    
    @IBAction func experts(sender: AnyObject) {
        ServiceModel.getExpert { (body, error, statusCode:Int) -> Void in
            
            if let err = error as NSError? {
                println(err)
                Utils.showError(err)
                return
            }
            
            if statusCode == 200 {
                var array = body as! NSArray
                self.performSegueWithIdentifier(Constants.Segue.Experts, sender: array)
            } else {
                Utils.showMessage(self, message: "There are currently no picks!")
            }
        }
    }
    
    @IBAction func getDollars(sender: AnyObject) {
        [self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier(Constants.ViewController.GetDollars) as! UIViewController, animated: true)]
    }
    
    @IBAction func clearBalance(sender: AnyObject) {
        var alert = UIAlertController(
            title: "Clear Records for $1.99?",
            message: "You will be charged $1.99 to clear you record?",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Clear Record", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
            MKStoreManager.sharedManager().buyFeature(Constants.IAP.ClearRecord,
                onComplete: { (purchasedProduct, _, _) -> Void in
                    println(purchasedProduct)
                    ServiceModel.clearRecord(self)
                })
                { () -> Void in
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel!", style: UIAlertActionStyle.Cancel, handler: { (alert) -> Void in
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func settings(sender: AnyObject) {
        self.performSegueWithIdentifier(Constants.Segue.Settings, sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == Constants.Segue.SportsList {
            var sportListViewControoler = segue.destinationViewController as! SportsViewController
            sportListViewControoler.isLeaderboards = sender as! Bool
        }
        
        if segue.identifier == Constants.Segue.Experts {
            var controller = segue.destinationViewController as! ExpertViewController
            controller.data = sender as! NSArray
        }
        
        if segue.identifier == Constants.Segue.MyPicks {
            var controller = segue.destinationViewController as! MyPicksViewController
            controller.data = sender as! NSArray
        }
        
        if segue.identifier == Constants.Segue.Pools {
            var vc = segue.destinationViewController as! PoolViewController
            vc.data = sender as! Array<AnyObject>
        }
        
    }
    
}
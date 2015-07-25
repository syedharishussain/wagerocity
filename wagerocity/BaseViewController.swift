//
//  BaseViewController.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 10/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var statsBar : StatsBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addGetDollarsButton()
        addStatsBarView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateStatsBar()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addGetDollarsButton() {
        let coins:UIImage! = UIImage(named: "coins")
        var getDollarButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        getDollarButton.frame = CGRectMake(0, 0, coins.size.width, coins.size.height)
        getDollarButton.setImage(coins, forState: UIControlState.Normal)
        getDollarButton.addTarget(self, action: "showGetDollarsViewController", forControlEvents: UIControlEvents.TouchUpInside)
        let getDollars = UIBarButtonItem(customView: getDollarButton)
        navigationItem.rightBarButtonItem = getDollars
    }
    
    func addStatsBarView() {
        
        for view in self.view.subviews {
            if view.isKindOfClass(UIView) && view.restorationIdentifier == Constants.View.StatsBarView {
                statsBar = StatsBarView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height))
                var newView: UIView = view as! UIView
                newView.addSubview(statsBar)

            }
        }
    }
    
    func showGetDollarsViewController() {
        [self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier(Constants.ViewController.GetDollars) as! UIViewController, animated: true)]
    }
    
    func updateStatsBar () {
        if let statsBarView = statsBar {
            let data = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.User) as! NSData
            var user: User = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! User
            statsBarView.updateStats(user)
        }
    }

}
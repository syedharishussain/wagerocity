//
//  PoolViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class PoolViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = Array<AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        var pool = data[indexPath.row] as! Dictionary<NSObject, AnyObject>
        
        var name = cell.viewWithTag(1) as! UILabel
        name.text = pool["name"] as? String
        
        var status = cell.viewWithTag(2) as! UILabel
        status.text = pool["privacy"] as? String
        
        var start = cell.viewWithTag(3) as! UILabel
        start.text = Utils.formatDateAmerican( (pool["from_date"] as? String)! )
        
        var end = cell.viewWithTag(4) as! UILabel
        end.text = Utils.formatDateAmerican( (pool["to_date"] as? String)! )
        
        var button = cell.viewWithTag(5) as! Button
        button.addTarget(self, action: "joinPool:", forControlEvents: UIControlEvents.TouchUpInside)
        
        if let isPoolJoined = pool["is_join"] as? Bool {
            if isPoolJoined {
                button.titleLabel?.text = "Joined"
                button.enabled = false
            }
        }
        
        button.id = (pool["pool_id"] as? String)!
        button.amount = (pool["amount"] as? String)!
        
        return cell
    }
    
    
    @IBAction func showMyPool(sender: AnyObject) {
        ServiceModel.getMyPools { (request, response, anyObject, error, statusCode) -> Void in
            if statusCode == 200 {
                self.performSegueWithIdentifier(Constants.Segue.MyPools, sender: anyObject as! Array<AnyObject>)
            } else {
                Utils.showMessage(self, message: "You have not joined any Pools yet!")
            }
        }
    }
    
    func joinPool(sender: Button) {
        if sender.amount != "0" {
            ServiceModel.consumeCredits(sender.amount, delegate: self)
        }
        ServiceModel.joinPool(sender.id, completion: { (_, _, anyObject, _, statusCode) -> Void in
            if statusCode == 200 {
                self.performSegueWithIdentifier(Constants.Segue.MyPools, sender: anyObject as! Array<AnyObject>)
            } else {
                
            }
        })
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == Constants.Segue.MyPools {
            var vc = segue.destinationViewController as! MyPoolViewController
            vc.data = sender as! Array<AnyObject>
        }

        
    }
    
    
}

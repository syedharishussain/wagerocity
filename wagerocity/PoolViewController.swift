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
        
        var label = cell.viewWithTag(6) as! UILabel
        
        if let isPoolJoined = pool["is_join"] as? Bool {
            if isPoolJoined {
                label.text = "Joined"
                button.enabled = false
            } else {
                label.text = "Join"
                button.enabled = true
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
    
    @IBAction func createPool(sender: AnyObject) {
        self.performSegueWithIdentifier("createPool", sender: nil)
    }
    
    func joinPool(sender: Button) {
        
        if sender.amount != "0" {
            
            let messageString = String(format: "$%@ will be deducted from your account, do you still want to join?", sender.amount)
            
            let alertController = UIAlertController(title: "Join Pool", message: messageString, preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                return
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                
                ServiceModel.joinPool(sender.id, delegate:self, completion: { (_, _, anyObject, _, statusCode) -> Void in
                    if statusCode == 200 {
                        self.performSegueWithIdentifier(Constants.Segue.MyPools, sender: anyObject as! Array<AnyObject>)
                    } else {
                        
                    }
                })
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
        } else {
            ServiceModel.joinPool(sender.id, delegate:self, completion: { (_, _, anyObject, _, statusCode) -> Void in
                if statusCode == 200 {
                    self.performSegueWithIdentifier(Constants.Segue.MyPools, sender: anyObject as! Array<AnyObject>)
                } else {
                    
                }
            })
        }
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

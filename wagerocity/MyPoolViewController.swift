//
//  MyPoolViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class MyPoolViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

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
        button.addTarget(self, action: "showPoolDetails:", forControlEvents: UIControlEvents.TouchUpInside)
        button.data = pool
        return cell
    }

    func showPoolDetails (sender: Button) {
        var pool: Pool = Pool.modelObjectWithDictionary(sender.data)
        self.performSegueWithIdentifier(Constants.Segue.PoolDetail, sender: pool)
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.Segue.PoolDetail {
            var vc = segue.destinationViewController as! PoolDetailViewController
            vc.data = sender as! Pool
        }
    }
    

}

class Button : UIButton {
    var data: Dictionary<NSObject, AnyObject>?
    var id: String = ""
    var amount : String = "0"
}

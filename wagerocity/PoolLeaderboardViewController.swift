//
//  PoolLeaderboardViewController.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 06/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class PoolLeaderboardViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = NSArray.new()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        var pool = data[indexPath.row] as! PoolMembers
        
        var rank = cell.viewWithTag(1) as! UILabel
        rank.text = NSString(format: "%d", indexPath.row + 1) as String
        
        var name = cell.viewWithTag(2) as! UILabel
        name.text = pool.username
        
        var amount = cell.viewWithTag(3) as! UILabel
        amount.text = NSString(format: "$%.2f", pool.dollars) as String
        
        var wlt = cell.viewWithTag(4) as! UILabel
        wlt.text = NSString(format: "%.0f-%.0f-%.0f", pool.win, pool.lost, pool.tie) as String
        
        return cell
    }
    
}

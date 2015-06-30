//
//  LeaderboardViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class LeaderboardViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, LeaderboardsPicksOfPlayerProtocol  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data : NSArray = NSArray.new()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! LeaderboardTableViewCell
        cell.setViews(indexPath.row + 1, data: data[indexPath.row] as! NSDictionary)
        cell.delegate = self
        return cell
    }
    
    //    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //        return 60.0
    //    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func selectedUserId(playerId: String) {
        ServiceModel.getPicksOfPlayer(playerId, completion: { (body, error) -> Void in
            if let err = error as NSError? {
                println(err)
            } else {
                var array = body as! NSArray
                println(array)
            }
        })
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

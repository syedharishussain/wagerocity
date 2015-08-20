//
//  PicksOfPlayerViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class PicksOfPlayerViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, PickOfPlayerProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var data: NSArray = NSArray.new()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! PickOfPlayerTableViewCell
        cell.setViews(data[indexPath.row] as! NSDictionary)
        cell.delegate = self
        return cell
    }
    
    func purchasedPick(picks: Array<Pick>) {
        self.performSegueWithIdentifier(Constants.Segue.MyPicks, sender: picks)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var vc = segue.destinationViewController as! MyPicksViewController
        vc.data = sender as! Array<Pick>
    }
    

}

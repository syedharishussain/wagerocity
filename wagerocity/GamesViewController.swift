//
//  GamesViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class GamesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data : Array<Game> = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //        tableView.registerClass(GameTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GameTableViewCell
        cell.setViews(&data[indexPath.row])
        return cell
    }
    
    
    @IBAction func showBetSlip(sender: AnyObject) {
        var oddHolders = [OddHolder]()
        for game in data {
            if game.oddHolders.count > 0 {
                game.oddHolders.enumerateObjectsUsingBlock({ (oddholder  , _, _) -> Void in
                    oddHolders.append(oddholder as! OddHolder)
                })
            }
        }
        
        if oddHolders.count > 0 {
            self.performSegueWithIdentifier(Constants.Segue.BetSlip, sender: oddHolders)
        } else {
            Utils.showMessage(self, message: "You have not chosen any picks! Please choose picks to view bet slip.")
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.Segue.BetSlip {
            var betSlip = segue.destinationViewController as! BetSlipViewController
            betSlip.oddHolders = sender as! Array <OddHolder>
        }
    }
}

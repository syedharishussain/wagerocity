//
//  GamesViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class GamesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, BetSlipCompletion {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data : Array<Game> = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        for game in data {
            game.oddHolders = NSMutableArray.new()
        }
        
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GameTableViewCell
        cell.setViews(&data[indexPath.row])
        return cell
    }
    
    
    @IBAction func showBetSlip(sender: AnyObject) {
        var oddHolders = [OddHolder]()
        for game in data {
            if game.oddHolders.count > 0 {
                game.oddHolders.enumerateObjectsUsingBlock({ (oddholder  , _, _) -> Void in
                    (oddholder as! OddHolder).poolId = game.poolId as String
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
            betSlip.delegate = self
        }
        
        if segue.identifier == Constants.Segue.MyPicks {
            var controller = segue.destinationViewController as! MyPicksViewController
            
            var picks = [Pick]()
            
            for p in sender as! NSArray {
                
                var pick :Pick! = Pick.modelObjectWithDictionary(p as! NSDictionary as [NSObject : AnyObject])
                
                picks.append(pick)
            }
            
            controller.data = picks
        }
    }
    
    // MARK: - BetSlipCompletion Delegate
    
    func showMyPicks() {
        ServiceModel.getMyPicks { (body, error, statusCode:Int) -> Void in
            if let err = error as NSError? {
                println(err)
                Utils.showError(err)
                return
            }
            
            if statusCode == 200 {
                var array = body as! NSArray
                
                array = array.filteredArrayUsingPredicate(NSPredicate(block: { (object , _) -> Bool in
                    let dic : NSDictionary = object as! NSDictionary
                    return (dic["odd_info"] as! NSArray).count > 0
                }))
                
                if array.count > 0 {
                    
                }
                self.performSegueWithIdentifier(Constants.Segue.MyPicks, sender: array)
            } else {
                Utils.showMessage(self, message: "There are currently no picks!")
            }
        }

    }
}

//
//  ExpertViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class ExpertViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, ExpertPicksOfPlayerProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var data:NSArray = NSArray.new()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! ExpertTableViewCell
        cell.setViews(data[indexPath.row] as! NSDictionary)
        cell.delegate = self
        return cell
    }

    func selectedUserId(playerId: String) {
        ServiceModel.getPicksOfPlayer(playerId, completion: { (body, error, statusCode) -> Void in
            
            if let err = error as NSError? {
                println(err)
            }
            
            if statusCode == 200 {
                var array = body as! NSArray
                println(array)
                if array.count > 0 {
                    self.performSegueWithIdentifier(Constants.Segue.PicksOfPlayer, sender: array)
                } else {
                    Utils.showMessage(self, message: "There are currently no picks!")
                }
            }
            else {
                Utils.showMessage(self, message: "There are currently no picks!")
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

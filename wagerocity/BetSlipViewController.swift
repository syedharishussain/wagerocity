//
//  BetSlipViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class BetSlipViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var placeBetButton: UIButton!
    
    var oddHolders : Array<OddHolder> = [OddHolder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addParlayOdd()
        // Do any additional setup after loading the view.
        
        self.view .addKeyboardNonpanningWithActionHandler({ (keyboardFrameInView: CGRect, opening: Bool, closing: Bool) -> Void in

            
            var frame = self.view.frame
            if opening {
                frame.origin.y = frame.origin.y - keyboardFrameInView.size.height
                self.view.frame = frame
                self.navigationController?.navigationBar.hidden = true
            }
            if closing {
                frame.origin.y = 0
                self.view.frame = frame
                self.navigationController?.navigationBar.hidden = false
            }
            
        })
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oddHolders.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BetSlipTableViewCell
        cell.setViews(&oddHolders[indexPath.row])
        return cell
    }
    
    @IBAction func placeBet(sender: AnyObject) {
        
    }
    
    func addParlayOdd () {
        if isParlayCaseTrue() {
            let parlayValue = Utils.parlayValue(oddHolders)
            
            var pOdd = OddHolder()
            
            pOdd.teamId = oddHolders[0].teamId
            pOdd.oddId = oddHolders[0].oddId
            pOdd.name = "Parlay " + (NSString(format: "( %d Odds)", oddHolders.count) as String)
            pOdd.teamVsTeam = ""
            pOdd.betTypeSPT = Constants.BetTypeSPT.Parley
            pOdd.betOT = "1"
            pOdd.riskValue = ""
            pOdd.parlayValue = parlayValue
            pOdd.leagueName = oddHolders[0].leagueName
            
            oddHolders.append(pOdd)
        }
    }
    
    func isParlayCaseTrue () -> Bool {
        if oddHolders.count == 2 {
            if oddHolders[0].teamId == oddHolders[1].teamId {
                if (oddHolders[0].betOT == "1" && oddHolders[0].betOT == "3" ) ||
                    (oddHolders[0].betOT == "3" && oddHolders[0].betOT == "1" ) {
                        return false
                }
            }
        }
        return oddHolders.count > 1
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

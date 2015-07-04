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
        checkteaserCase()
        // Do any additional setup after loading the view.
        
        self.view .addKeyboardNonpanningWithActionHandler({ (keyboardFrameInView: CGRect, opening: Bool, closing: Bool) -> Void in
            
            if self.oddHolders.count > 2 {
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
        processBet()
    }
    
    func processBet () {
        var array = oddHolders.filter { (oddholder) -> Bool in
            return oddholder.isChecked && oddholder.riskValue != "0.0" && oddholder.riskValue != ""
        }
        
        if array.isEmpty {
//            Utils.showMessage(self, message: "")
            return
        }
        
        for odd: OddHolder in array {
            ServiceModel.betOnGame(
                odd.oddId,
                oddVal: odd.betTypeSPT == Constants.BetTypeSPT.Parley ? NSString(format: "%.2f",odd.parlayValue) as String : odd.oddValue,
                position: odd.isTeamA ? "over" : "under",
                matchDetail: odd.teamVsTeam,
                oddType: "ao",
                stake: odd.riskValue,
                matchID: odd.teamId,
                teamName: odd.name,
                sportsName: odd.leagueName,
                bet_type: odd.betTypeSPT,
                bet_ot: odd.betOT,
                bet_parent: "",
                is_pool_bet: "",
                completion: { (request, response, body, error, statusCode) -> Void in
                    if statusCode == 200 {
                        println(body)
                    }
            })
        }
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
    
    func addTeaserOdd () {
        var count = filter(oddHolders, { (oddholder) -> Bool in
            return oddholder.betOT == "3" || oddholder.betOT == "4"
        }).count
        
        if count > 0 && count < 7 {
            var value: Dictionary<Double, Int> = teaserValuesForSport(oddHolders[0].leagueName)[count-2]
            
            var tOdd = OddHolder()
            
            tOdd.teamId = oddHolders[0].teamId
            tOdd.oddId = oddHolders[0].oddId
            tOdd.name = "Teaser"
            tOdd.teamVsTeam = ""
            tOdd.betTypeSPT = Constants.BetTypeSPT.Teaser
            tOdd.betOT = "1"
            tOdd.riskValue = "0.0"
            tOdd.teaserValues = value
            
            //            oddHolders.append(tOdd)
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
    
    func checkteaserCase () {
        if oddHolders.count > 1 {
            if oddHolders[0].leagueName == "nba" || oddHolders[0].leagueName == "nfl" {
                if oddHolders.count != 2 {
                    let case1 = !(oddHolders[0].betOT == "1" && oddHolders[1].betOT == "3")
                    let case2 = !(oddHolders[0].betOT == "3" && oddHolders[1].betOT == "1")
                    let case3 = !(oddHolders[0].betOT == "1" && oddHolders[1].betOT == "4")
                    let case4 = !(oddHolders[0].betOT == "4" && oddHolders[1].betOT == "1")
                    
                    if case1 || case2 || case3 || case4 {
                        addTeaserOdd()
                    }
                }
            }
        }
    }
    
    func teaserValuesForSport(leagueName: String) -> Array<Dictionary<Double, Int>> {
        var array = Array<Dictionary<Double, Int>>()
        if leagueName == "nfl" {
            var v = Dictionary<Double, Int>()
            
            v[6.0] = -110
            v[6.5] = -120
            v[7.0] = -130
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[6.0] = 180
            v[6.5] = 160
            v[7.0] = 140
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[6.0] = 300
            v[6.5] = 250
            v[7.0] = 200
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[6.0] = 450
            v[6.5] = 400
            v[7.0] = 300
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[6.0] = 600
            v[6.5] = 550
            v[7.0] = 500
            
            array.append(v)
        } else if leagueName == "nba" {
            var v = Dictionary<Double, Int>()
            
            v[4.0] = -110
            v[4.5] = -120
            v[5.0] = -130
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[4.0] = 180
            v[4.5] = 160
            v[5.0] = 140
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[4.0] = 300
            v[4.5] = 250
            v[5.0] = 200
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[4.0] = 450
            v[4.5] = 400
            v[5.0] = 300
            
            array.append(v)
            
            v = Dictionary<Double, Int>()
            
            v[4.0] = 750
            v[4.5] = 700
            v[5.0] = 650
            
            array.append(v)
        }
        return array
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}

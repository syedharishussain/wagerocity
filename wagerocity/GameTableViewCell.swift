//
//  GameTableViewCell.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 03/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    var game: Game = Game()
    
    @IBOutlet weak var flagA: UIImageView!
    @IBOutlet weak var flagB: UIImageView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var nameA: UILabel!
    @IBOutlet weak var nameB: UILabel!
    @IBOutlet weak var psA: UILabel!
    @IBOutlet weak var psB: UILabel!
    @IBOutlet weak var mlA: UILabel!
    @IBOutlet weak var mlB: UILabel!
    @IBOutlet weak var over: UILabel!
    @IBOutlet weak var under: UILabel!
    @IBOutlet weak var overUnder: UILabel!
    
    @IBOutlet weak var pitcherA: UILabel!
    @IBOutlet weak var pitcherB: UILabel!
    
    @IBOutlet weak var buttonPSA: UIButton!
    @IBOutlet weak var buttonPSB: UIButton!
    @IBOutlet weak var buttonMLA: UIButton!
    @IBOutlet weak var buttonMLB: UIButton!
    @IBOutlet weak var buttonOver: UIButton!
    @IBOutlet weak var buttonUnder: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setViews (inout game: Game) {
        self.game = game
        
        var value = Utils.oddValues(game.oddA, oddB:game.oddB)
        
        self.flagA.sd_setImageWithURL(NSURL(string: game.logoA), placeholderImage: UIImage(named: "sports"))
        self.flagB.sd_setImageWithURL(NSURL(string: game.logoB), placeholderImage: UIImage(named: "sports"))
        
        self.nameA.text = game.nameA
        self.nameB.text = game.nameB
        
        self.date.text = Utils.formatDate(game.cstStartTime)
        
        self.psA.text = value.psA
        self.psB.text = value.psB
        self.mlA.text = value.mlA
        self.mlB.text = value.mlB
        self.over.text = value.over
        self.under.text = value.under
        self.overUnder.text = value.overUnder
        
        game.oddHolders = NSMutableArray.new()
        
        buttonPSA.selected = false;
        buttonPSB.selected = false;
        buttonMLA.selected = false;
        buttonMLB.selected = false;
        buttonOver.selected = false;
        buttonUnder.selected = false;
        
        if value.psA == "-" { buttonPSA.enabled = false }
        if value.psB == "-" { buttonPSB.enabled = false }
        if value.mlA == "-" { buttonMLA.enabled = false }
        if value.mlB == "-" { buttonMLB.enabled = false }
        if value.over == "-" { buttonOver.enabled = false }
        if value.under == "-" { buttonUnder.enabled = false }
        
        if game.leagueName == "mlb" {
            self.pitcherA.hidden = false
            self.pitcherB.hidden = false
            
            self.pitcherA.text = game.pitcherA
            self.pitcherB.text = game.pitcherB
        }
    }
    
    @IBAction func pointSpreadA(sender: AnyObject) {
        
        buttonPSA.selected = !buttonPSA.selected
        
        if buttonPSA.selected {
            
            var oddHolder = createOddHolder(game, isTeamA: true, betTypeString: Constants.BetType.PointSpread)
            game.oddHolders.addObject(oddHolder)
            
        } else {
            removeOddholder(&game, betTypeString: Constants.BetType.PointSpread, isTeamA: true)
        }
    }
    
    @IBAction func pointSpreadB(sender: AnyObject) {
        buttonPSB.selected = !buttonPSB.selected
        
        if buttonPSB.selected {
            
            var oddHolder = createOddHolder(game, isTeamA: false, betTypeString: Constants.BetType.PointSpread)
            game.oddHolders.addObject(oddHolder)
            
        } else {
            removeOddholder(&game, betTypeString: Constants.BetType.PointSpread, isTeamA: false)
        }
    }
    
    @IBAction func moneyLineA(sender: AnyObject) {
        buttonMLA.selected = !buttonMLA.selected
        
        if buttonMLA.selected {
            
            var oddHolder = createOddHolder(game, isTeamA: true, betTypeString: Constants.BetType.MoneyLine)
            game.oddHolders.addObject(oddHolder)
            
        } else {
            removeOddholder(&game, betTypeString: Constants.BetType.MoneyLine, isTeamA: true)
        }
    }
    
    @IBAction func moneyLineB(sender: AnyObject) {
        buttonMLB.selected = !buttonMLB.selected
        
        if buttonMLB.selected {
            
            var oddHolder = createOddHolder(game, isTeamA: false, betTypeString: Constants.BetType.MoneyLine)
            game.oddHolders.addObject(oddHolder)
            
        } else {
            removeOddholder(&game, betTypeString: Constants.BetType.MoneyLine, isTeamA: false)
        }
    }
    
    @IBAction func overA(sender: AnyObject) {
        buttonOver.selected = !buttonOver.selected
        
        if buttonOver.selected {
            
            var oddHolder = createOddHolder(game, isTeamA: true, betTypeString: Constants.BetType.Over)
            game.oddHolders.addObject(oddHolder)
            
        } else {
            removeOddholder(&game, betTypeString: Constants.BetType.Over, isTeamA: true)
        }
    }
    
    @IBAction func underA(sender: AnyObject) {
        buttonUnder.selected = !buttonUnder.selected
        
        if buttonUnder.selected {
            
            var oddHolder = createOddHolder(game, isTeamA: false, betTypeString: Constants.BetType.Under)
            game.oddHolders.addObject(oddHolder)
            
        } else {
            removeOddholder(&game, betTypeString: Constants.BetType.Under, isTeamA: false)
        }
    }
    
    func createOddHolder(game: Game, isTeamA: Bool, betTypeString: String) -> OddHolder {
        var oddHolder = OddHolder()
        
        oddHolder.teamId = game.teamANumber//(betTypeString == Constants.BetType.Under) ? game.teamANumber : isTeamA ? game.teamANumber : game.teamBNumber
        oddHolder.name = isTeamA ? game.nameA : game.nameB
        oddHolder.oddId = (betTypeString == Constants.BetType.Under) ?  game.oddA.oddId :  isTeamA ? game.oddA.oddId : game.oddB.oddId
        oddHolder.teamVsTeam = game.nameA + " vs " + game.nameB
        oddHolder.betTypeSPT = Constants.BetTypeSPT.Single
        oddHolder.betTypeString = betTypeString
        oddHolder.leagueName = game.leagueName
        oddHolder.isChecked = true
        oddHolder.isTeamA = isTeamA
        oddHolder.poolCredit = game.poolCredit
        
        switch (betTypeString) {
        case Constants.BetType.PointSpread :
            oddHolder.oddValue = isTeamA ? game.oddA.point : game.oddB.point
            oddHolder.betOT = "3"
            oddHolder.pointSpreadString = isTeamA ? Utils.pointSpreadString(game.oddA) : Utils.pointSpreadString(game.oddB)
        case Constants.BetType.MoneyLine :
            oddHolder.oddValue = isTeamA ? game.oddA.money : game.oddB.money
            oddHolder.betOT = "1"
        case Constants.BetType.Over :
            oddHolder.oddValue = game.oddA.over
            oddHolder.betOT = "4"
        case Constants.BetType.Under :
            oddHolder.oddValue = game.oddA.under
            oddHolder.betOT = "4"
        default :
            break
        }
        
        return oddHolder
    }
    
    func removeOddholder (inout game: Game, betTypeString: String, isTeamA: Bool) {
        let teamId = (betTypeString == Constants.BetType.Under) ? game.teamANumber : isTeamA ? game.teamANumber : game.teamBNumber
        let oddId = (betTypeString == Constants.BetType.Under) ? game.oddA.oddId : isTeamA ? game.oddA.oddId : game.oddB.oddId
        
        game.oddHolders.filterUsingPredicate(NSPredicate(block: { (object, binding) -> Bool in
            let oddHolder: OddHolder = object as! OddHolder
            return (oddHolder.teamId == teamId && oddHolder.oddId == oddId && oddHolder.betTypeString == betTypeString) ? false : true
            
        }))
    }
}

//
//  BetSlipTableViewCell.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 04/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class BetSlipTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var betInfo: UILabel!
    @IBOutlet weak var teamVsTeam: UILabel!
    
    @IBOutlet weak var risk: UITextField!
    @IBOutlet weak var win: UITextField!
    
    @IBOutlet weak var checkbox: UIButton!
    
    var oddholder:OddHolder = OddHolder()
    
    var oddValue: String = "0.0"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.risk.delegate = self
        self.win.delegate = self
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setViews (inout oddholder: OddHolder) {
        
        self.checkbox.selected = oddholder.isChecked
        
        var isParlay = oddholder.oddType == Constants.BetTypeSPT.Parley.lowercaseString
        
        oddValue = isParlay ? NSString(format: "%.2f", oddholder.parlayValue) as String :  oddholder.oddValue
        
        self.oddholder = oddholder
        self.name.text = oddholder.name
        self.teamVsTeam.text = oddholder.teamVsTeam
        self.betInfo.text = isParlay ? "" :  oddholder.betTypeString + " " + Utils.signedString( oddholder.oddValue )
        self.risk.text = isParlay ? "" :  oddholder.riskValue
        self.win.text = Utils.getToWinAmountString(self.risk.text, betOddValue: oddValue)
    }
    
    @IBAction func checkBox(sender: AnyObject) {
        self.checkbox.selected = !self.checkbox.selected
        oddholder.isChecked = self.checkbox.selected
    }
    
    @IBAction func riskValueUpdate(sender: AnyObject) {
        var tf: UITextField = sender as! UITextField
        if oddholder.oddType == Constants.BetTypeSPT.Parley.lowercaseString {
            self.win.text = String(format:"%.2f", (tf.text as NSString).doubleValue * oddholder.parlayValue )
        } else {
            self.win.text = Utils.getToWinAmountString(tf.text, betOddValue:oddValue )
        }
        self.oddholder.riskValue = tf.text
    }
    @IBAction func toWinValueUpdate(sender: AnyObject) {
        var tf: UITextField = sender as! UITextField
        if oddholder.oddType == Constants.BetTypeSPT.Parley.lowercaseString {
            self.risk.text = String(format:"%.2f", (tf.text as NSString).doubleValue / oddholder.parlayValue )
        } else {
            self.risk.text = Utils.getRiskAmountString(tf.text, betOddValue: oddValue)
        }
        self.oddholder.riskValue = self.risk.text
    }
}

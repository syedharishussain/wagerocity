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
        self.oddholder = oddholder
        self.name.text = oddholder.name
        self.teamVsTeam.text = oddholder.teamVsTeam
        self.betInfo.text = oddholder.betTypeString + oddholder.oddValue
        self.risk.text = oddholder.riskValue
        self.win.text = Utils.getToWinAmountString(self.risk.text, betOddValue: oddholder.oddValue)
    }
    
    @IBAction func checkBox(sender: AnyObject) {
        self.checkbox.selected = !self.checkbox.selected
    }
    
    @IBAction func riskValueUpdate(sender: AnyObject) {
        var tf: UITextField = sender as! UITextField
        self.win.text = Utils.getToWinAmountString(tf.text, betOddValue:"120" )
        self.oddholder.riskValue = tf.text
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
}

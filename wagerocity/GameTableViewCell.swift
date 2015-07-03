//
//  GameTableViewCell.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 03/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    
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
    
    func setViews (game: Game) {
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
        
        
        
        
    }
    
    @IBAction func pointSpreadA(sender: AnyObject) {
        
    }
    
    @IBAction func pointSpreadB(sender: AnyObject) {
        
    }
    
    @IBAction func moneyLineA(sender: AnyObject) {
        
    }
    
    @IBAction func moneyLineB(sender: AnyObject) {
    }
    
    @IBAction func overA(sender: AnyObject) {
        
    }
    
    @IBAction func underA(sender: AnyObject) {
          
    }
}

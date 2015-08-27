//
//  PickOfPlayerTableViewCell.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 01/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

protocol PickOfPlayerProtocol {
    func purchasedPick(picks : Array<Pick>) -> Void
}

class PickOfPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var flagA: UIImageView!
    @IBOutlet weak var flagB: UIImageView!
    
    @IBOutlet weak var nameA: UILabel!
    @IBOutlet weak var nameB: UILabel!
    @IBOutlet weak var overUnder: UILabel!
    @IBOutlet weak var psA: UILabel!
    @IBOutlet weak var psB: UILabel!
    @IBOutlet weak var mlA: UILabel!
    @IBOutlet weak var mlB: UILabel!
    @IBOutlet weak var over: UILabel!
    @IBOutlet weak var under: UILabel!
    
    @IBOutlet weak var buyPickButton: UIButton!
    
    var data : NSDictionary!
    
    var delegate : PickOfPlayerProtocol! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViews (data : NSDictionary) {
        
        self.data = data
        
        var value = Utils.oddValues(data["team_A_Odds"] as! NSDictionary, oddB: data["team_B_Odds"] as! NSDictionary)
        
        self.flagA.sd_setImageWithURL(NSURL(string: (data["team_A_logo"] as? String)!), placeholderImage: UIImage(named: "sports"))
        self.flagB.sd_setImageWithURL(NSURL(string: (data["team_B_logo"] as? String)!), placeholderImage: UIImage(named: "sports"))
        
        self.nameA.text = (data["team_A_name"] as? String)!
        self.nameB.text = (data["team_B_name"] as? String)!
        
        self.psA.text = value.psA
        self.psB.text = value.psB
        self.mlA.text = value.mlA
        self.mlB.text = value.mlB
        self.over.text = value.over
        self.under.text = value.under
        self.overUnder.text = value.overUnder
    }

    @IBAction func buyPick(sender: AnyObject) {
        MKStoreManager.sharedManager().buyFeature(Constants.IAP.PurchasePicks,
            onComplete: { (purchasedProduct, _, _) -> Void in
                var pick : Pick = Pick()
                var dic: NSDictionary = self.data["bet_info"] as! NSDictionary
                pick.teamName = dic["team_name"] as! String
                pick.startTime = self.data["cst_start_time"] as! String
                pick.matchDet = dic["match_det"] as! String
                pick.betOt = dic["bet_ot"] as! String
                pick.pos = dic["pos"] as! String
                pick.oddsVal = dic["odds_val"] as! String
                pick.stake = dic["stake"] as! String
                pick.betResult = dic["bet_result"] as! String
                pick.teamALogo = self.data["team_A_logo"] as! String
                pick.teamBLogo = self.data["team_B_logo"] as! String
                pick.teamANumber = self.data["team_A_number"] as! String
        pick.teamBNumber = self.data["team_B_number"] as! String
        pick.matchId = dic["match_id"] as! String
                self.delegate .purchasedPick([pick])
            })
            { () -> Void in
        }
        
        
    }

}
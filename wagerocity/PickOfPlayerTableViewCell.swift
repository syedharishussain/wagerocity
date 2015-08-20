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

//{
//    "bet_info" =         {
//        "bet_created" = 1435676131;
//        "bet_dis_odds" = "a:2:{i:2015070125713;a:6:{s:2:\"id\";s:7:\"1388523\";s:8:\"point_id\";s:7:\"1388523\";s:5:\"point\";s:3:\"105\";s:9:\"point_mid\";s:3:\"1.3\";s:8:\"total_id\";s:7:\"1388524\";s:5:\"total\";a:3:{s:4:\"over\";s:4:\"-115\";s:5:\"under\";s:4:\"-105\";s:9:\"total_mid\";s:3:\"2.8\";}}i:2015070125714;a:4:{s:2:\"id\";s:7:\"1388525\";s:8:\"point_id\";s:7:\"1388525\";s:5:\"point\";s:4:\"-125\";s:9:\"point_mid\";s:4:\"-1.3\";}}";
//        "bet_id" = 12385;
//        "bet_odd_val" = "";
//        "bet_ot" = 3;
//        "bet_parent" = 0;
//        "bet_processed" = pending;
//        "bet_result" = pending;
//        "bet_type" = single;
//        "is_mobile_bet" = 0;
//        "is_pool_bet" = 0;
//        "league_name" = soccer;
//        "match_det" = "Coritiba vs Atletico MG";
//        "match_id" = 2015070125713;
//        "odd_id" = 1388525;
//        "odd_type" = ao;
//        "odds_val" = "-125";
//        "os_bet" = 0;
//        "pool_id" = 0;
//        pos = under;
//        stake = "1000.00";
//        "team_name" = "Atletico MG -1.3 -125";
//        "teaser_point" = 0;
//        "usr_id" = 695;
//    };
//    "cst_start_time" = "2015-07-01 19:00:00";
//    "is_purchased" = 1;
//    leagueName = Soccer;
//    "team_A_Odds" =         {
//        id = 1388523;
//        over = "-115";
//        point = 105;
//        "point_id" = 1388523;
//        "point_mid" = "1.3";
//        "total_id" = 1388524;
//        "total_mid" = "2.8";
//        under = "-105";
//    };
//    "team_A_fullname" = "";
//    "team_A_logo" = "";
//    "team_A_name" = Coritiba;
//    "team_A_nickname" = Coritiba;
//    "team_A_number" = 2015070125713;
//    "team_B_Odds" =         {
//        id = 1388525;
//        over = "";
//        point = "-125";
//        "point_id" = 1388525;
//        "point_mid" = "-1.3";
//        "total_id" = "";
//        "total_mid" = "";
//        under = "";
//    };
//    "team_B_fullname" = "";
//    "team_B_logo" = "";
//    "team_B_name" = "Atletico MG";
//    "team_B_nickname" = "Atletico MG";
//    "team_B_number" = 2015070125714;
//    "user_info" =         {
//        address = "--";
//        birthdate = "0000-00-00";
//        city = "";
//        country = US;
//        "creation_date" = "2014-10-24 15:57:18";
//        credits = 6547;
//        currentrecord = "3204.50";
//        email = "hhussain@plego.com";
//        "facebook_uid" = 10153811957273998;
//        language = "en_US";
//        overallrank = "25th Place";
//        score = "3204.50";
//        state = 0;
//        timezone = "America/Los_Angeles";
//        "user_id" = 695;
//        username = syedharishussain;
//        zip = "";
//    };
//}
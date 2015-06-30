//
//  LeaderboardTableViewCell.swift
//  wagerocity
//
//  Created by Haris on 30/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var stats: UILabel!
    @IBOutlet weak var buyPicksButton: UIButton!
    
    var userRank = 0
    var userId = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setViews (rank: Int, data : NSDictionary) {
        userId = (data["usr_id"] as? String)!
        self.rank.text = String(rank) + "."
        self.name.text = data["username"] as? String
        self.stats.text = (data["win_percentage"] as? String)! + " | " + "$" + String(format:"%.2f",(data["points"] as? NSNumber)!.doubleValue)
        self.userImage .sd_setImageWithURL(NSURL(string: (data["image_url"] as? String)!), placeholderImage: UIImage(named: "user1"))
        
        if (data["total_picks"] as? NSNumber)!.intValue == 0 {
            self.buyPicksButton.enabled = false
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buyPicks(sender: AnyObject) {
        
    }
}

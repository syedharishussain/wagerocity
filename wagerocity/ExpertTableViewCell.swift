//
//  ExpertTableViewCell.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 02/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

protocol ExpertPicksOfPlayerProtocol {
    func selectedUserId(playerId: String)
}

class ExpertTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var buyPicksButton: UIButton!
    
    var delegate : ExpertPicksOfPlayerProtocol! = nil
    var playerId = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViews (data : NSDictionary) {
        playerId = (data["user_id"] as? String)!
        self.name.text = data["displayname"] as? String
        self.desc.text = data["description"] as? String
        self.userImage.sd_setImageWithURL(NSURL(string: (data["image_url"] as? String)!), placeholderImage: UIImage(named: "user1"))
        
        if (data["total_picks"] as? NSNumber)!.intValue == 0 {
            self.buyPicksButton.hidden = true
        }

    }

    @IBAction func buyPicks(sender: AnyObject) {
        delegate.selectedUserId(playerId)
    }
}

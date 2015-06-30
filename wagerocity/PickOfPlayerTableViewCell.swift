//
//  PickOfPlayerTableViewCell.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 01/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViews (data : NSDictionary) {
        
    }

    @IBAction func buyPick(sender: AnyObject) {
    }

}

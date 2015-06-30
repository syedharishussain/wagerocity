//
//  SportListTableViewCell.swift
//  wagerocity
//
//  Created by Haris on 30/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class SportListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

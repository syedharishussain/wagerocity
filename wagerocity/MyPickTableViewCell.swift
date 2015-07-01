//
//  MyPickTableViewCell.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 02/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class MyPickTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViews (data : NSDictionary) {
        var pick : Pick! = Pick.modelObjectWithDictionary(data as [NSObject : AnyObject])
    }

}

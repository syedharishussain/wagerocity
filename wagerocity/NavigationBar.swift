//
//  NavigationBar.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 11/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

@IBDesignable class NavigationBar: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var delegate: BaseViewController!
    var backButton: UIButton!
    var getDolalrsButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        

    }
    
    required init(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file

    }

    @IBAction func back(sender: AnyObject) {
        println("Back")
    }
    
    @IBAction func getDollars(sender: AnyObject) {
        println("Get Dollars")
    }
}

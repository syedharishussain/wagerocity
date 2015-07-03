//
//  BetSlipViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class BetSlipViewController: BaseViewController {

    var oddHolders : Array<OddHolder> = [OddHolder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println(self.oddHolders)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

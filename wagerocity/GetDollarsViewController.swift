//
//  GetDollarsViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class GetDollarsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rookie(sender: AnyObject) {

        MKStoreManager.sharedManager().buyFeature(Constants.IAP.Rookie, onComplete: { (purchasedProduct, _, _) -> Void in
            println(purchasedProduct)
        }) { () -> Void in
            
        }
    }

    @IBAction func chaser(sender: AnyObject) {
    }
    
    @IBAction func player(sender: AnyObject) {
    }
    
    @IBAction func guru(sender: AnyObject) {
    }

    @IBAction func bawse(sender: AnyObject) {
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

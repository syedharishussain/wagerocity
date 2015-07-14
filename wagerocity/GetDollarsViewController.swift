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
        
        MKStoreManager.sharedManager().buyFeature(Constants.IAP.Rookie,
            onComplete: { (purchasedProduct, _, _) -> Void in
                println(purchasedProduct)
                ServiceModel.buyCredits("2000", delegate: self)
            })
            { () -> Void in
                
        }
    }
    
    @IBAction func chaser(sender: AnyObject) {
        MKStoreManager.sharedManager().buyFeature(Constants.IAP.Chaser,
            onComplete: { (purchasedProduct, _, _) -> Void in
                println(purchasedProduct)
                ServiceModel.buyCredits("6250", delegate: self)
            })
            { () -> Void in
                
        }

    }
    
    @IBAction func player(sender: AnyObject) {
        MKStoreManager.sharedManager().buyFeature(Constants.IAP.Player,
            onComplete: { (purchasedProduct, _, _) -> Void in
                println(purchasedProduct)
                ServiceModel.buyCredits("30000", delegate: self)
            })
            { () -> Void in
                
        }

    }
    
    @IBAction func guru(sender: AnyObject) {
        MKStoreManager.sharedManager().buyFeature(Constants.IAP.Guru,
            onComplete: { (purchasedProduct, _, _) -> Void in
                println(purchasedProduct)
                ServiceModel.buyCredits("87500", delegate: self)
            })
            { () -> Void in
                
        }

    }
    
    @IBAction func bawse(sender: AnyObject) {
        MKStoreManager.sharedManager().buyFeature(Constants.IAP.Bawse,
            onComplete: { (purchasedProduct, _, _) -> Void in
                println(purchasedProduct)
                ServiceModel.buyCredits("200000", delegate: self)
            })
            { () -> Void in
        }

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

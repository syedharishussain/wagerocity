//
//  ServiceModel.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 01/07/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit
import Alamofire

class ServiceModel: NSObject {
    static func getPicksOfPlayer (playerId: String, completion: (AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getGamesOfPlayer", parameters:
            ["playerID" : playerId, "userID" : Utils.getUser().userId])
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                let responseObject = response as NSHTTPURLResponse?
                completion(body, error, (responseObject?.statusCode as Int?)!)
        }
    }
    
    static func getExpert (completion:(AnyObject?, NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getExperts", parameters:
            ["userId" : Utils.getUser().userId])
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                let responseObject = response as NSHTTPURLResponse?
                completion(body, error, (responseObject?.statusCode as Int?)!)
        }
    }
    
    static func getMyPicks (completion:(AnyObject?, NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getMyPicks", parameters:
        ["userId" : Utils.getUser().userId])
        .responseJSON{ (request, response, body, error) in
            Utils .hideLoader()
            let responseObject = response as NSHTTPURLResponse?
            completion(body, error, (responseObject?.statusCode as Int?)!)
        }
    }
}
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
    
    static func createUser (facebookID: String, firstName: String, lastName: String, email: String, completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.POST, "http://api.wagerocity.com/createUser", parameters: [
            "facebookID" : facebookID,
            "firstName" : firstName,
            "lastName" : lastName,
            "email" : email
            ], encoding: ParameterEncoding.JSON)
        .responseJSON{ (request, response, body, error) -> Void in
            println(body)
            let responseObject = response as NSHTTPURLResponse?
            completion(request, response, body, error, (responseObject?.statusCode as Int?)!)
        }
    }
    
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
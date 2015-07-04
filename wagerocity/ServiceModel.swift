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
    
    static func getUser (facebookID: String, completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getUser", parameters: ["facebookID" : facebookID])
            .responseJSON{ (request, response, body, error) in
                Utils.hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        Utils.hideLoader()
                        Utils.showError(newError)
                        return
                    }
                    
                } else {
                    var dic : NSDictionary = body as! NSDictionary
                    
                    CLSLogv("Login Logs: \nRequest: %@\nResponse: %@\nBody: %@", getVaList([request as NSURLRequest, (response as NSHTTPURLResponse?)!, dic]))
                    
                    Utils.saveUserObject(body!)
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, response, body, error, (responseObject?.statusCode as Int?)!)
                }
        }
    }
    
    static func createUser (facebookID: String, firstName: String, lastName: String, email: String, completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.POST, "http://api.wagerocity.com/createUser", parameters: [
            "facebookID" : facebookID,
            "firstName" : firstName,
            "lastName" : lastName,
            "email" : email
            ], encoding: ParameterEncoding.JSON)
            .responseJSON{ (request, response, body, error) -> Void in
                
                
                if (error != nil) {
                    if let newError:NSError = error {
                        Utils.hideLoader()
                        Utils.showError(newError)
                        return
                    }
                    
                } else {
                    var dic : NSDictionary = body as! NSDictionary
                    
                    CLSLogv("Login Logs: \nRequest: %@\nResponse: %@\nBody: %@\n Email: %@", getVaList([request as NSURLRequest, (response as NSHTTPURLResponse?)!, dic, email]))
                    
                    Utils.saveUserObject(body!)
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, response, body, error, (responseObject?.statusCode as Int?)!)
                }
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
    
    static func getGames (leagueName: String, completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getGames", parameters: ["leagueName" : leagueName])
            .responseJSON{ (request, response, body, error) in
                Utils.hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        Utils.hideLoader()
                        Utils.showError(newError)
                        return
                    }
                } else {
                    //TODO: status Code
                    //warning: status
                    
                    CLSLogv("Login Logs: \nRequest: %@\nResponse: %@", getVaList([request as NSURLRequest, (response as NSHTTPURLResponse?)!]))
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, response, body, error, (responseObject?.statusCode as Int?)!)
                }
        }
    }
    
    static func betOnGame (
        oddID:          String,
        oddVal:         String,
        position:       String,
        matchDetail:    String,
        oddType:        String,
        stake:          String,
        matchID:        String,
        teamName:       String,
        sportsName:     String,
        bet_type:       String,
        bet_ot:         String,
        bet_parent:     String,
        is_pool_bet:    String,
        completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
            
            var params = [
                "userID"        : Utils.getUser().userId,
                "oddID"         : oddID,
                "oddVal"        : oddVal,
                "position"      : position,
                "matchDetail"   : matchDetail,
                "oddType"       : oddType,
                "stake"         : stake,
                "matchID"       : matchID,
                "teamName"      : teamName,
                "sportsName"    : sportsName,
                "bet_type"      : bet_type,
                "bet_ot"        : bet_ot,
                "bet_parent"    : bet_parent,
                "is_pool_bet"   : is_pool_bet,
                "bet_result"    : "pending",
                "bet_processed" : "pending",
                "is_mobile_bet" : "1"
            ]
            
            Utils.showLoader()
            Alamofire.request(.POST, "http://api.wagerocity.com/betOnGame", parameters: params, encoding: ParameterEncoding.JSON)
                .responseJSON{ (request, response, body, error) -> Void in
                    Utils.hideLoader()
                    if (error != nil) {
                        if let newError:NSError = error {
                            
                            Utils.showError(newError)
                            return
                        }
                        
                    } else {
                        
                        CLSLogv("Login Logs: \nRequest: %@\nResponse: %@", getVaList([request as NSURLRequest, (response as NSHTTPURLResponse?)!]))
                        
                        let responseObject = response as NSHTTPURLResponse?
                        completion(request, response, body, error, (responseObject?.statusCode as Int?)!)
                    }
            }
            
            
    }
}
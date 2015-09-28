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
    
    static func betOnGame1 (
        userId:          String,
        oddId:         String,
        oddVal:       String,
        pos:    String,
        matchDetail:        String,
        stake:          String,
        matchID:        String,
        oddType:    String,
        teamName:       String,
        sportsName:     String,
        bet_ot:         String,
        is_pool_bet:    String,
        poolId: String,
        numberOfBets : String,
        completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
            
            var params = [
                "usr_id"            : Utils.getUser().userId,
                "odd_id"            : oddId,
                "odds_val"          : oddVal,
                "pos"               : pos,
                "match_det"         : matchDetail,
                "odd_type"          : oddType,
                "stake"             : stake,
                "match_id"          : matchID,
                "team_name"         : teamName,
                "pool_id"           : "",
                "league_name"       : sportsName,
                "place_bet_type"    : "single_bet",
                "bet_ot"            : bet_ot,
                "is_pool_bet"       : is_pool_bet,
                "num_bets"          : numberOfBets,
                "mat_cond"          : "GAME"
            ]
            
            Utils.showLoader()
            var array = [params]
            
            Alamofire.request(.POST, "http://api.wagerocity.com/myBetPlace", parameters: params, encoding: .JSON)
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
    
    
    static func buyCredits (amount: String, delegate: BaseViewController) {
        Utils.showLoader()
        Alamofire.request(.POST, "http://api.wagerocity.com/buyCredits", parameters: [
            "userId" : Utils.getUser().userId,
            "creditAmount" : amount
            ], encoding: ParameterEncoding.JSON)
            .responseJSON{ (request, response, body, error) -> Void in
                Utils.hideLoader()
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                    
                } else {
                    var dic : NSDictionary = body as! NSDictionary
                    
                    CLSLogv("Login Logs: \nRequest: %@\nResponse: %@\nBody: %@", getVaList([request as NSURLRequest, (response as NSHTTPURLResponse?)!, dic]))
                    
                    Utils.saveUserObject(body!)
                    let responseObject = response as NSHTTPURLResponse?
                    delegate.updateStatsBar()
                }
        }
    }
    
    static func consumeCredits (amount: String, delegate: BaseViewController) {
        Utils.showLoader()
        Alamofire.request(.POST, "http://api.wagerocity.com/consumeCredits", parameters: [
            "userId" : Utils.getUser().userId,
            "debitAmount" : amount
            ]
            , encoding: ParameterEncoding.JSON)
            .responseJSON{ (request, response, body, error) -> Void in
                Utils.hideLoader()
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                    
                } else {
                    var dic : NSDictionary = body as! NSDictionary
                    
                    CLSLogv("Login Logs: \nRequest: %@\nResponse: %@\nBody: %@", getVaList([request as NSURLRequest, (response as NSHTTPURLResponse?)!, dic]))
                    
                    Utils.saveUserObject(body!)
                    let responseObject = response as NSHTTPURLResponse?
                    delegate.updateStatsBar()
                }
        }
    }
    
    static func getPools (completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getAllPools", parameters:
            ["userId" : Utils.getUser().userId])
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                } else {
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, responseObject, body, error, (responseObject?.statusCode as Int?)!)
                    
                }
        }
    }
    
    static func getMyPools (completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getMyPools", parameters:
            ["userId" : Utils.getUser().userId])
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                } else {
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, responseObject, body, error, (responseObject?.statusCode as Int?)!)
                    
                }
        }
    }
    
    static func joinPool (poolId: String, completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.POST, "http://api.wagerocity.com/joinPool", parameters:
            ["userId" : Utils.getUser().userId,
                "poolId" : poolId], encoding: ParameterEncoding.JSON)
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                } else {
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, responseObject, body, error, (responseObject?.statusCode as Int?)!)
                    
                }
        }
    }
    
    static func clearRecord (delegate: BaseViewController) {
        Utils.showLoader()
        Alamofire.request(.POST, "http://api.wagerocity.com/clearRecord", parameters:
            ["userId" : Utils.getUser().userId], encoding: ParameterEncoding.JSON)
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                } else {
                    if ((response as NSHTTPURLResponse?)!.statusCode as Int?)! == 200 {
                        ServiceModel.getUser("", completion: { (request, response, body, error, statusCode) -> Void in
                            if statusCode == 200 {
                                delegate.updateStatsBar()
                            }
                        })
                    } else {
                        
                    }
                    
                }
        }
    }
    
    static func followPlayer (playerId: String, follow: Bool, completion: (Bool) -> Void) {
        Utils.showLoader()
        
        var methodName = follow ? "followPlayer" : "unfollowPlayer"
        var params = [
            "userId" : Utils.getUser().userId,
            "playerId" : playerId
        ]
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        Alamofire.request(.POST, "http://api.wagerocity.com/" + methodName, parameters:
            params, encoding: ParameterEncoding.JSON)
            
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        completion(false)
                        Utils.showError(newError)
                        return
                    }
                } else {
                    if ((response as NSHTTPURLResponse?)!.statusCode as Int?)! == 200 {
                        completion(true)
                    } else {
                        
                    }
                    
                }
        }
        
    }
    
    static func getBetParent (completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        Alamofire.request(.GET, "http://api.wagerocity.com/getBetParent", parameters:nil)
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                } else {
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, responseObject, body, error, (responseObject?.statusCode as Int?)!)
                    
                }
        }
    }
    
    static func createPool (leagueName: String, leagueId:String, userId: String, poolName: String, poolMotto: String, poolDesc: String, poolPrivacy: String, poolSize: String, amount: String, minPeople: String, toDate: String, fromDate: String, poolImage: String, completion: (NSURLRequest, NSHTTPURLResponse?, AnyObject? , NSError?, Int) -> Void) {
        Utils.showLoader()
        
        var params = [
            "league_name": leagueName,
            "league_id" : leagueId,
            "userId" : userId,
            "poolName": poolName,
            "poolDesc": poolDesc,
            "poolMotto":poolMotto,
            "poolPrivacy":poolPrivacy.lowercaseString,
            "poolSize":poolSize,
            "amount": amount,
            "minPeople":minPeople,
            "to_date": toDate,
            "from_date":fromDate,
            "pool_image": poolImage]
        
        Alamofire.request(.POST, "http://api.wagerocity.com/createPool", parameters:
            params, encoding: ParameterEncoding.JSON)
            .responseJSON{ (request, response, body, error) in
                Utils .hideLoader()
                
                if (error != nil) {
                    if let newError:NSError = error {
                        
                        Utils.showError(newError)
                        return
                    }
                } else {
                    
                    let responseObject = response as NSHTTPURLResponse?
                    completion(request, responseObject, body, error, (responseObject?.statusCode as Int?)!)
                }
        }

        
    }
    
}
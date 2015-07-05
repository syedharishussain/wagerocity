//
//  Constants.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

struct Constants {
    struct UserDefaults {
        static let User = "user_object"
    }
    
    struct IAP {
        static let Rookie           = "com.wagerocity.rookie"
        static let Chaser           = "com.wagerocity.chaser"
        static let Player           = "com.wagerocity.player"
        static let Guru             = "com.wagerocity.guru"
        static let Bawse            = "com.wagerocity.bawse"
        static let ClearRecord      = "com.wagerocity.purchase_pick"
        static let PurchasePicks    = "com.wagerocity.clear_record"
    }
    
    struct ViewController {
        static let GetDollars       = "getDollarsViewController"
    }
    
    struct View {
        static let StatsBarView     = "statsBar"
    }
    
    struct BetTypeSPT {
        static let Single = "SINGLE"
        static let Parley = "PARLEY"
        static let Teaser = "TEASER"
    }
    
    struct BetType {
        static let PointSpread = "Point Spread"
        static let MoneyLine = "Money Line"
        static let Over = "Over"
        static let Under = "Under"
        
    }
    
    struct Segue {
        static let Dashboard        = "dashboard"
        static let SportsList       = "sportsList"
        static let Experts          = "experts_controller"
        static let Leaderboard      = "leaderboards_controller"
        static let MyPicks          = "MyPicks_Controller"
        static let Pools            = "Pools_Controller"
        static let MyPools          = "myPools"
        static let PoolDetail       = "poolDetail"
        static let Games            = "gamesList"
        static let BetSlip          = "betSlip"
        static let PicksOfPlayer    = "buyPicks"
        static let Settings         = "settings"
        static let PoolLeaderbpards = "poolLeaderboards"
    }
}

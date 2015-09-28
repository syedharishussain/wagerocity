//
//  Utils.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit


class Utils {
    
    static func facebookId () -> String {
        let data = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.FacebookId) as! String
        return data
    }
    
    static func setFacebookId (facebookId: String) {
        NSUserDefaults.standardUserDefaults().setObject(facebookId, forKey: Constants.UserDefaults.FacebookId)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    static func getUser () -> User {
        let data = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.User) as! NSData
        var user: User = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! User
        return user
    }
    
    static func saveUserObject(body: AnyObject) {
        var user : User! = User.modelObjectWithDictionary(body as! Dictionary<NSObject, AnyObject>)
        NSUserDefaults.standardUserDefaults().setObject(NSKeyedArchiver.archivedDataWithRootObject(user), forKey: Constants.UserDefaults.User)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    static func showLoader () {
        SVProgressHUD.showWithStatus("Loading", maskType:UInt(SVProgressHUDMaskTypeBlack))
    }
    
    static func showMessage (delegate: UIViewController, message:String) {
        UIAlertView(title: nil, message: message, delegate: delegate, cancelButtonTitle: "Ok").show()
    }
    
    static func hideLoader () {
        SVProgressHUD.dismiss()
    }
    
    static func showError (error: NSError) {
        SVProgressHUD.showErrorWithStatus(error.localizedDescription)
    }
    
    static func sportsList (isLeaderboard: Bool) -> Array<String> {
        
        var array = ["NFL", "NCAA Football", "MLB", "NBA", "NCAA Basketball", "NHL", "Soccer" ,"Tennis"]
        
        if isLeaderboard {
            array = ["Overall", "NFL", "NCAA Football", "MLB", "NBA", "NCAA Basketball", "NHL", "Soccer" ,"Tennis"]
        }
        
        return array
    }
    
    static func sportsImage(name: String) -> UIImage {
        var string = name.lowercaseString
        if string == "nfl" {
            return UIImage(named: "nfl")!
        } else if string == "ncaa football" {
            return UIImage(named: "ncaa_football")!
        } else if string == "mlb" {
            return UIImage(named: "mlb")!
        } else if string == "nba" {
            return UIImage(named: "nba")!
        } else if string == "ncaa basketball" {
            return UIImage(named: "ncaa_basketball")!
        } else if string == "nhl" {
            return UIImage(named: "nhl")!
        } else if string == "soccer" {
            return UIImage(named: "soccer")!
        }else if string == "tennis" {
            return UIImage(named: "tennis")!
        }else if string == "overall" {
            return UIImage(named: "Icon-60")!
        }
        return UIImage(named: "sports")!
    }
    
    static func sportsNameForParam (name: String) -> String {
        var string = name.lowercaseString
        
        if string == "nfl" {
            return "nfl"
        } else if string == "ncaa football" {
            return "ncaaf"
        } else if string == "mlb" {
            return "mlb"
        } else if string == "nba" {
            return "nba"
        } else if string == "ncaa basketball" {
            return "ncaab"
        } else if string == "nhl" {
            return "nhl"
        } else if string == "soccer" {
            return "soccer"
        }else if string == "tennis" {
            return "tennis"
        }else if string == "overall" {
            return "all"
        }
        return ""
    }
    
    static func sportsNameAndIdForPool (name: String) -> (leagueName:String, leagueId:String) {
        var string = name.lowercaseString
        
        if string == "nfl" {
            return ("nfl","1")
        } else if string == "ncaa football" {
            return ("ncaaf","2")
        } else if string == "mlb" {
            return ("mlb","5")
        } else if string == "nba" {
            return ("nba","3")
        } else if string == "ncaa basketball" {
            return ("ncaab","4")
        } else if string == "nhl" {
            return ("nhl","7")
        } else if string == "soccer" {
            return ("soccer","9")
        }else if string == "tennis" {
            return ("tennis","12")
        }
        return ("","")
    }
    
    static func getBetTypeOT(betOt: String , position: String ) -> String {
        switch (betOt) {
        case "1": return "MoneyLine"
        case "3": return "PointSpread"
        case "4": return position.lowercaseString == "over" ? "Over" : "Under"
        default: return "-"
        }
    }
    
    static func getToWinAmount (value: Double, betOddValue: Double) -> Double {
        
        if betOddValue > 0 {
            
            var amountNeededToWinADollar = 100 / abs(betOddValue)
            
            var percentage = abs(amountNeededToWinADollar - 1) / amountNeededToWinADollar
            
            var percentageBasedValue = value * percentage
            
            return value + percentageBasedValue//ceil(value + percentageBasedValue)
            
        } else {
            
            var amountNeededToWinADollar = abs(betOddValue) / 100
            
            var percentage = abs(amountNeededToWinADollar - 1) / amountNeededToWinADollar
            
            var percentageBasedValue = value * percentage
            
            return value - percentageBasedValue//ceil(value - percentageBasedValue)
            
        }
        
    }
    
    static func getToWinAmountString (value: String, betOddValue: String) -> String {
        return String(format: "%.2f", Utils.getToWinAmount((value as NSString).doubleValue, betOddValue: (betOddValue as NSString).doubleValue))
    }
    
    static func getRiskAmount (value: Double, betOddValue:Double ) -> Double {
        if betOddValue > 0 {
            var amountNeededToWinADollar = abs(betOddValue) / 100
            
            var percentage = abs(amountNeededToWinADollar - 1) / amountNeededToWinADollar
            
            var percentageBasedValue = value * percentage
            
            return value - percentageBasedValue//ceil(value - percentageBasedValue)
        } else {
            var amountNeededToWinADollar = 100 / abs(betOddValue)
            
            var percentage = abs(amountNeededToWinADollar - 1) / amountNeededToWinADollar
            
            var percentageBasedValue = value * percentage
            
            return value + percentageBasedValue//ceil(value + percentageBasedValue)
        }
        
    }
    
    static func getRiskAmountString (value: String, betOddValue: String) -> String {
        return String(format: "%.2f", Utils.getRiskAmount((value as NSString).doubleValue, betOddValue: (betOddValue as NSString).doubleValue))
    }
    
    static func signedString (value: AnyObject) -> String {
        
        var number:Double = 0.0
        number = value.doubleValue
        
        return number > 0.0 ? String(format: "+%.2f",number) : String(format: "%.2f",number)
        
    }
    
    static func pointSpreadString (data: NSDictionary) -> String  {
        var point: String = "0.0"
        var pointMid:String = "0.0"
        if let value = (data["point"] as? String) {
            point = value
        }
        
        if let pointMidValue = data["point_mid"] as? String {
            pointMid = pointMidValue
        }

        var pointSpread = Utils.signedString(pointMid) + "(" + Utils.signedString(point) + ")"
        return pointSpread
        
    }
    
    static func pointSpreadString (odd: Odd) -> String  {
        if let point = odd.point {
            var value = (point as String)
            var point = value
            var pointSpread = "-"
            if let pointMid = odd.pointMid {
                pointSpread =  Utils.signedString(odd.pointMid as String) + "(" + Utils.signedString(value) + ")"
            }
            return pointSpread
        } else {
            return "-"
        }
    }
    
    static func oddValues (oddA: NSDictionary, oddB: NSDictionary) -> (psA:String, psB:String, mlA:String, mlB:String, over:String, under:String, overUnder:String) {
        return (
            Utils.pointSpreadString(oddA),
            Utils.pointSpreadString(oddB),
            oddA["money"] != nil ? Utils.signedString((oddA["money"] as! String)) : "-",
            oddB["money"] != nil ? Utils.signedString((oddB["money"] as! String)) : "-",
            oddA["over"] != nil ? Utils.signedString((oddA["over"] as! String)) : "-",
            oddA["under"] != nil ? Utils.signedString((oddA["under"] as! String)) : "-",
            String(format: "Over\n| %@ |\nUnder", Utils.signedString((oddA["total_mid"] as! String)))
        )
    }
    
    static func oddValues (oddA: Odd, oddB: Odd) -> (psA:String, psB:String, mlA:String, mlB:String, over:String, under:String, overUnder:String) {
        var overUnder = "-"
        if let ou = oddA.totalMid {
            overUnder = String(format: "Over\nO | %@ | U\nUnder", Utils.signedString(ou))
        }
        
        return (
            Utils.pointSpreadString(oddA),
            Utils.pointSpreadString(oddB),
            oddA.money != nil ? Utils.signedString((oddA.money as String)) : "-",
            oddB.money != nil ? Utils.signedString((oddB.money as String)) : "-",
            oddA.over  != nil ? Utils.signedString((oddA.over as String)) : "-",
            oddA.under != nil ? Utils.signedString((oddA.under as String)) : "-",
            overUnder
        )
    }
    
    static func formatDate (dateString:String) -> String {
        var formattedDate = String(format: "%@", NSDate(string: dateString, formatString: "yyyy-MM-dd HH:mm:ss"
//            , timeZone: NSTimeZone(abbreviation: "CST")
            )
            .formattedDateWithFormat("EEEE, MMM dd, yyyy hh:mm a")) + " CST"
        return formattedDate
    }
    
    static func formatDateAmerican (dateString:String) -> String {
        var formattedDate = String(format: "%@", NSDate(string: dateString, formatString: "yyyy-MM-dd", timeZone: NSTimeZone(abbreviation: "CST")).formattedDateWithFormat("MM-dd-yyyy"))
        return formattedDate
    }
    
    
    static func parlayValue (oddHolders : Array<OddHolder>) -> Double {
        var parlayValue = 1.0

        for oddholder in oddHolders {
            var oddValue: Double = oddholder.oddValue.doubleValue()
            
            if oddValue > 0 {
                let multipliyer = (oddValue + 100.0) / 100.0
                parlayValue = parlayValue * multipliyer
            } else {
                let multipliyer = (abs(oddValue) + 100.0) / abs(oddValue)
                parlayValue = parlayValue * multipliyer
            }
        }
        
        return parlayValue - 1.0
    }
    
}

//
//  SportsViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit
import Alamofire

class SportsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var isLeaderboards : Bool = false
    var leagueName : String = ""
    
    var sportsList : Array<String>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportsList = Utils.sportsList(isLeaderboards)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportsList.count;
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SportListTableViewCell
        
        cell.label?.text = sportsList[indexPath.row]
        cell.sportImage?.image = Utils.sportsImage(sportsList[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        leagueName = Utils.sportsNameForParam(sportsList[indexPath.row])
        APICall()
    }
    
    func APICall () {
        if isLeaderboards {
            NSURLCache.sharedURLCache().removeAllCachedResponses()
            SVProgressHUD.showWithStatus("Loading", maskType:UInt(SVProgressHUDMaskTypeBlack))
            Alamofire.request(.GET, "http://api.wagerocity.com/getLeaderboards", parameters: ["leagueName" : leagueName ,
                "year" : "2015", "userId" : Utils.getUser().userId])
                .responseJSON{ (request, response, body, error) in
                    SVProgressHUD.dismiss()
                    if let newError:NSError = error {
                        SVProgressHUD.showErrorWithStatus(newError.localizedDescription)
                    } else {
                        var array = body as! NSArray
                        array = array.sortedArrayUsingDescriptors([NSSortDescriptor(key: "points", ascending: false)])
                        self.performSegueWithIdentifier(Constants.Segue.Leaderboard, sender: array.mutableCopy())
                    }
                    
                }
        } else {
            ServiceModel.getGames(leagueName, completion: { (_, _, body, _, statusCode) -> Void in
                if statusCode == 200 {
                    var games : Array <Game> = [Game]()
                    var gameArray : NSArray! = body as! NSArray
                    gameArray.enumerateObjectsUsingBlock({ (object, _, _) -> Void in
                        var game: Game = Game.modelObjectWithDictionary(object as! NSDictionary as [NSObject : AnyObject])
                        game.leagueName = self.leagueName
                        games.append(game)
                    })
                    
                    games = games.filter({ (game: Game) -> Bool in
                        let date: NSDate = NSDate(string: game.cstStartTime, formatString: "yyyy-MM-dd HH:mm:ss", timeZone: NSTimeZone(abbreviation: "CST"))
                        
                        let gameTimeInterval : NSTimeInterval = NSDate().timeIntervalSinceDate(date)
                        let currentTimeInterval = NSDate().timeIntervalSinceNow
                        
                        return gameTimeInterval < currentTimeInterval
                    })
                    
                    self.performSegueWithIdentifier(Constants.Segue.Games, sender: games)
                } else {
                    Utils.showMessage(self, message: "There are currently no games!")
                }
            })
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.Segue.Leaderboard {
            var leaderboardViewController = segue.destinationViewController as! LeaderboardViewController
            leaderboardViewController.data = sender as! NSMutableArray
            leaderboardViewController.leagueName = leagueName
        }
        if segue.identifier == Constants.Segue.Games {
            var controller = segue.destinationViewController as! GamesViewController
            controller.data = sender as! Array<Game>
        }
    }
    
    
}

//
//  PoolDetailViewController.swift
//  wagerocity
//
//  Created by Haris on 26/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class PoolDetailViewController: BaseViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var commisioner: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    @IBOutlet weak var poolSize: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var poolLeaderboardsButton: UIButton!
    @IBOutlet weak var poolGamesButton: UIButton!
    
    var data = Pool()
    var poolCredit:Double = 0.0
    var userId :  String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userId = Utils.getUser().userId
        
        for object in self.data.poolMembers {
            var member = object as! PoolMembers
            if member.userId == userId {
                poolCredit = member.dollars
            }
        }
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.name.text = data.name
        if data.commisioner.count > 0 {
            self.commisioner.text = data.commisioner[0].username
        } else {
            self.commisioner.text = "-"
        }
        
        self.leagueName.text = data.poolLeague
        self.start.text = Utils.formatDateAmerican(data.fromDate)
        self.end.text = Utils.formatDateAmerican(data.toDate)
        self.poolSize.text = data.size
        self.amount.text = data.amount
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func poolLeaderboards(sender: AnyObject) {
        if (data.poolMembers as NSArray).count > 0 {
            self.performSegueWithIdentifier(Constants.Segue.PoolLeaderbpards, sender: data.poolMembers as NSArray)
        } else {
            Utils.showMessage(self, message: "There are currently no pool member in the Leaderboards!")
        }
    }
    
    @IBAction func poolGames(sender: AnyObject) {
        ServiceModel.getGames(self.data.poolLeague, completion: { (_, _, body, _, statusCode) -> Void in
            if statusCode == 200 {
                var games : Array <Game> = [Game]()
                var gameArray : NSArray! = body as! NSArray
                gameArray.enumerateObjectsUsingBlock({ (object, _, _) -> Void in
                    var game: Game = Game.modelObjectWithDictionary(object as! NSDictionary as [NSObject : AnyObject])
                    game.leagueName = self.data.poolLeague
                    game.poolId = self.data.poolId
                    game.poolCredit = self.poolCredit
                    games.append(game)
                })
                self.performSegueWithIdentifier(Constants.Segue.Games, sender: games)
            } else {
                Utils.showMessage(self, message: "There are currently no games!")
            }
        })
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.Segue.PoolLeaderbpards {
            var vc = segue.destinationViewController as! PoolLeaderboardViewController
            vc.data = sender as! NSArray
        }
        
        if segue.identifier == Constants.Segue.Games {
            var vc = segue.destinationViewController as! GamesViewController
            vc.data = sender as! Array
        }
    }
    
    
}

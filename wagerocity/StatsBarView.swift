//
//  StatsBarView.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 20/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

@IBDesignable class StatsBarView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var delegate: BaseViewController!
    
    var availableLabel:UILabel!
    var rankLabel: UILabel!
    var recordLabel: UILabel!
    
    var availableTF: UITextField!
    var RankTF: UITextField!
    var recordTF: UITextField!
    
    var labelY:CGFloat = 2.0
    
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        setupVies(frame)
        
        // 3. Setup view from .xib file
        
    }
    
    required init(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        
    }
    
    func setupVies (frame: CGRect) {
        addBgImageView(frame)
        
        addAvailableTF(frame)
        addRankTF(frame)
        addRecordTF(frame)
        
        addAvailableLabel(frame)
        addRankLabel(frame)
        addRecordLabel(frame)
        
    }
    
    func updateStats (user: User) {
        
        if let available = user.credits as Double? {
            var formatter = NSNumberFormatter()
            formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
            formatter.stringFromNumber(NSNumber(double: user.credits))
            
            availableTF.text = "$" + formatter.stringFromNumber(NSNumber(double: user.credits))!
        }
        
        if let rank = user.overallrank {
            RankTF.text = rank
        }
        
        if let record = user.currentrecord {
            recordTF.text = "$" + record
        }
        
    }

    func addBgImageView (frame: CGRect) {
        var bgImageView = UIImageView(frame: frame)
        bgImageView.image = UIImage(named: "heading_bg")
        self.addSubview(bgImageView)
    }
    
    func addAvailableTF (frame: CGRect) {
        availableTF = UITextField(frame: CGRectMake(10, frame.height - 30 - 5, 96, 30))
        availableTF.textColor = UIColor.whiteColor()
        availableTF.font = UIFont.systemFontOfSize(14.0)
        availableTF.textAlignment = NSTextAlignment.Center
        availableTF.borderStyle = UITextBorderStyle.None
        availableTF.background = UIImage(named: "available_field")
        availableTF.adjustsFontSizeToFitWidth = true
        self.addSubview(availableTF)
    }
    
    func addRankTF (frame: CGRect) {
        RankTF = UITextField(frame: CGRectMake(self.center.x - 48, frame.height - 30 - 5, 96, 30))
        RankTF.font = UIFont.systemFontOfSize(14.0)
        RankTF.textColor = UIColor.whiteColor()
        RankTF.textAlignment = NSTextAlignment.Center
        RankTF.borderStyle = UITextBorderStyle.None
        RankTF.background = UIImage(named: "available_field")
        RankTF.adjustsFontSizeToFitWidth = true
        self.addSubview(RankTF)
    }
    
    func addRecordTF (frame: CGRect) {
        recordTF = UITextField(frame: CGRectMake(frame.width-10-96, frame.height - 30 - 5, 96, 30))
        recordTF.font = UIFont.systemFontOfSize(14.0)
        recordTF.textColor = UIColor.whiteColor()
        recordTF.textAlignment = NSTextAlignment.Center
        recordTF.borderStyle = UITextBorderStyle.None
        recordTF.background = UIImage(named: "available_field")
        recordTF.adjustsFontSizeToFitWidth = true
        self.addSubview(recordTF)
    }
    
    func addAvailableLabel (frame: CGRect) {
        var string:NSString = "AVAILABLE"
        var size:CGSize = string.sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(15.0)])

        availableLabel = UILabel(frame: CGRectMake(availableTF.center.x - ceil(size.width) / 2, labelY, ceil(size.width), ceil(size.height)))
        availableLabel.text = string as String;
        availableLabel.textColor = UIColor.grayColor()
        availableLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(availableLabel)
    }
    
    func addRankLabel (frame: CGRect) {
        var string:NSString = "RANK"
        var size:CGSize = string.sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(15.0)])
        
        rankLabel = UILabel(frame: CGRectMake(self.center.x - (ceil(size.width) / 2), labelY, ceil(size.width), ceil(size.height)))
        rankLabel.text = string as String;
        rankLabel.textColor = UIColor.grayColor()
        rankLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(rankLabel)
    }
    
    func addRecordLabel (frame: CGRect) {
        var string:NSString = "RECORD"
        var size:CGSize = string.sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(15.0)])
        
        recordLabel = UILabel(frame: CGRectMake(recordTF.center.x - ceil(size.width) / 2, labelY, ceil(size.width), ceil(size.height)))
        recordLabel.text = string as String;
        recordLabel.textColor = UIColor.grayColor()
        recordLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(recordLabel)
    }
    
    
    
}

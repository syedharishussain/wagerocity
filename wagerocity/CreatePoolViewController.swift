//
//  CreatePoolViewController.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 04/09/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit

class CreatePoolViewController: BaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var selectSportsTf: UITextField!
    @IBOutlet weak var poolNametf: UITextField!
    @IBOutlet weak var poolMottoTf: UITextField!
    @IBOutlet weak var poolDescTv: UITextView!
    @IBOutlet weak var poolPrivacyTf: UITextField!
    @IBOutlet weak var poolSizeTf: UITextField!
    @IBOutlet weak var poolNumberOfPeopleTf: UITextField!
    @IBOutlet weak var amountTf: UITextField!
    @IBOutlet weak var toDateTf: UITextField!
    @IBOutlet weak var fromDateTf: UITextField!
    
    var leagueName = ""
    var leagueId = ""
    
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = self.containerView.frame.size
        
        scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.OnDrag
        
        var toolbar : UIToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.width, 50))
        toolbar.barStyle = UIBarStyle.Default
        toolbar.items = [UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "done")]
        toolbar.sizeToFit()
        
        self.poolNametf.inputAccessoryView = toolbar
        self.poolDescTv.inputAccessoryView = toolbar
        self.poolMottoTf.inputAccessoryView = toolbar
        self.amountTf.inputAccessoryView = toolbar
        self.poolNumberOfPeopleTf.inputAccessoryView = toolbar
        //        self.poolNametf.inputAccessoryView = toolbar
        
        
        // Do any additional setup after loading the view.
    }
    
    func done () {
        self.view.endEditing(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //        IQKeyboardManager.sharedManager().enable = false
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func selectSports(sender: AnyObject) {
        var colors = ["NFL", "NCAA Football", "MLB", "NBA", "NCAA Basketball", "NHL", "Soccer" ,"Tennis"]
        ActionSheetStringPicker.showPickerWithTitle("Select Sports",
            rows: colors,
            initialSelection: 0,
            doneBlock: { (picker, row, object) -> Void in
                self.selectSportsTf.text = object as! String
                self.selectSportsTf.resignFirstResponder()
                var league: (String,String) = Utils.sportsNameAndIdForPool(object as! String)
                self.leagueName = league.0
                self.leagueId = league.1
            },
            cancelBlock: { (picker) -> Void in
                self.selectSportsTf.resignFirstResponder()
            },
            origin: sender)
        
    }
    
    @IBAction func poolPrivacy(sender: AnyObject) {
        var colors = ["private", "open"]
        ActionSheetStringPicker.showPickerWithTitle("Select Pool Privacy",
            rows: colors,
            initialSelection: 0,
            doneBlock: { (picker, row, object) -> Void in
                self.poolPrivacyTf.text = object as! String
                self.poolPrivacyTf.resignFirstResponder()
            },
            cancelBlock: { (picker) -> Void in
                self.poolPrivacyTf.resignFirstResponder()
            },
            origin: sender)
    }
    
    @IBAction func poolSize(sender: AnyObject) {
        var colors = ["LIMIT", "UNLIMITED"]
        ActionSheetStringPicker.showPickerWithTitle("Select Pool Size",
            rows: colors,
            initialSelection: 0,
            doneBlock: { (picker, row, object) -> Void in
                self.poolSizeTf.text = object as! String
                self.poolSizeTf.resignFirstResponder()
            },
            cancelBlock: { (picker) -> Void in
                self.poolSizeTf.resignFirstResponder()
            },
            origin: sender)
    }
    
    @IBAction func toDate(sender: AnyObject) {
        ActionSheetDatePicker.showPickerWithTitle("Select To Date", datePickerMode: UIDatePickerMode.Date, selectedDate: NSDate(), doneBlock: { (picker, date, object) -> Void in
            
            var df = NSDateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            
            self.toDateTf.text = df.stringFromDate(date)
            self.toDateTf.resignFirstResponder()
            }, cancelBlock: { (picker) -> Void in
                self.toDateTf.resignFirstResponder()
            }, origin: self.toDateTf)
    }
    
    @IBAction func fromDate(sender: AnyObject) {
        ActionSheetDatePicker.showPickerWithTitle("Select From Date", datePickerMode: UIDatePickerMode.Date, selectedDate: NSDate(), doneBlock: { (picker, date, object) -> Void in
            
            var df = NSDateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            
            self.fromDateTf.text = df.stringFromDate(date)
            self.fromDateTf.resignFirstResponder()
            }, cancelBlock: { (picker) -> Void in
                self.fromDateTf.resignFirstResponder()
            }, origin: self.fromDateTf)
    }
    
    @IBAction func submit(sender: AnyObject) {
        if self.poolNametf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Provide Pool Name", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.poolMottoTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Provide Motto", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.poolDescTv.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Provide Description", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.selectSportsTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Select Pool Sports", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.poolPrivacyTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Select Pool Privacy", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.poolSizeTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Select Pool Size", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.amountTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Provide Pool Amount", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.toDateTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Select To Date", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.fromDateTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Seelct From Date", delegate: nil, cancelButtonTitle: "ok").show()
        } else if self.poolNumberOfPeopleTf.text == "" {
            UIAlertView(title: "Incomplete Data", message: "Please Provide Minimum Number of People", delegate: nil, cancelButtonTitle: "ok").show()
        } else {
            
            ServiceModel.createPool(
                self.leagueName,
                leagueId: self.leagueId,
                userId: Utils.getUser()!.userId,
                poolName: self.poolNametf.text,
                poolMotto: self.poolMottoTf.text,
                poolDesc: self.poolDescTv.text,
                poolPrivacy: self.poolPrivacyTf.text,
                poolSize: poolSizeTf.text,
                amount: amountTf.text,
                minPeople: self.poolNumberOfPeopleTf.text,
                toDate: self.toDateTf.text,
                fromDate: self.fromDateTf.text,
                poolImage: " ",
                completion: { (request, response, obj, error, statusCode) -> Void in
                    
                    Utils.showMessage(self, message: "Pool Created Successfully!")
                    self.navigationController?.popViewControllerAnimated(true)
                    
            })
            
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

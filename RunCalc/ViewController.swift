//
//  ViewController.swift
//  RunCalc
//
//  Created by Samuel Oh on 11/23/15.
//  Copyright (c) 2015 Samuel Oh. All rights reserved.
//

import UIKit

// Initialize a variable to hold info that pickerviews are left at
var userHours = String()
var userMinutes = String()
var userSeconds = String()
var userDist = String()
var userUnitOfMeasure = String()
var defaults = NSUserDefaults()

var distanceDisplay = String()
var timeDisplay = String()
var marText = String()
var halfmarText = String()
var tenKText = String()
var fiveKText = String()
var threeKText = String()
var mileText = String()
var sixteenhunText = String()
var twelvehunText = String()
var oneKText = String()
var eighthunText = String()
var fourhunText = String()
var twohunText = String()
var onehunText = String()


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    // Create links from storyboard to code
    @IBOutlet weak var userTime: UIPickerView!
    @IBOutlet weak var userDistance: UIPickerView!
    
    
    // Input into array what will be displayed in picker view
    let pickerData = [["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
        ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"],
        ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]]
    
    // Another picker view with user's distance
    let pickerData2 = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "1600", "800", "400", "200", "100", "40"],
        ["Mile",  "Kilometer", "Meters", "Marathon"]]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Connect data for pickerdatas        
        userTime.delegate = self
        userTime.dataSource = self
        userDistance.delegate = self
        userDistance.dataSource = self
        userTime.tag = 0
        userDistance.tag = 1
    }
    
    
    override func didReceiveMemoryWarning()
    {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }
    
    // Method that defines number of columns in picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        if pickerView.tag == 0
        {
            // return 3 for the hour, minute, and second columns
            return 3
        }
        else
        {
            // return 2 for 2 columns in second pickerview
            return 2
        }
    }
    
    // Method that defines number of rows in picker
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        // for the first set of data
        if pickerView.tag == 0
        {
            // return number of rows per each column
            if component == 0
            {
                return 10
            }
            return 60
        }
        
        else
        {
        // return number of total rows per each column
            if component == 0
            {
                return 16
            }
            return 4
        }
    }
    
    // The data to return for the row and column that's passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView.tag == 0
        {
            return pickerData[component][row]
        }
        else
        {
            return pickerData2[component][row]
        }
    }
    
    // function in PickerView to use to detect what pickerview is stopped on and save it in a var
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView.tag == 0
        {
            if (component == 0)
            {
                userHours = pickerData[component][row]
            }
            else if (component == 1)
            {
                userMinutes = pickerData[component][row]
            }
            else
            {
                userSeconds = pickerData[component][row]
            }
        }
        else if pickerView.tag == 1
        {
            if (component == 0)
            {
                userDist = pickerData2[component][row]
            }
            else
            {
                userUnitOfMeasure = pickerData2[component][row]
            }
        }
    }
    
    
    
    // Define what button should do when clicked
    @IBAction func buttonPress(sender: AnyObject)
    {
        
        // take into account specific case (default) when user doesn't move pickerview
        if userDist == ""
        {
            userDist = "1"
        }
        if userUnitOfMeasure == ""
        {
            userUnitOfMeasure = "Mile"
        }
        if userHours == ""
        {
            userHours = "0"
        }
        if userMinutes == ""
        {
            userMinutes = "00"
        }
        if userSeconds == ""
        {
            userSeconds = "00"
        }
        
        // create string to display in next tab
        distanceDisplay = userDist + " " + userUnitOfMeasure
        timeDisplay = userHours + ":" + userMinutes + ":" + userSeconds + " pace"
        appDelegate.distanceDisplay = distanceDisplay
        appDelegate.timeDisplay = timeDisplay
        
        
        // display appropriate user info in pace display screen
        if distanceDisplay == ""
        {
            distanceDisplay = userDist + " " + userUnitOfMeasure
            appDelegate.distanceDisplay = distanceDisplay
        }
        if timeDisplay == ""
        {
              timeDisplay = userHours + ":" + userMinutes + ":" + userSeconds + " pace"
            appDelegate.timeDisplay = timeDisplay
        }
        

        // Abstraction: function to standardize display of numbers
        func standardizeDisplay(newMSec: Int?, newSec: Int, newMin: Int?, newHour: Int?) -> String {
            if newHour != nil && newMSec == nil{
                // if the min is less than 10, add 0 for proper spacing
                if newMin < 10 && newSec > 10
                {
                    let newText = "\(String(newHour!)):0\(String(newMin!)):\(String(newSec))"
                    return newText
                }
                
                // if the sec is less than 10, add 0 for proper spacing
                else if newSec < 10 && newMin > 10
                {
                    let newText = "\(String(newHour!)):\(String(newMin!)):0\(String(newSec))"
                    return newText
                }
                
                // if min <10 and sec <10 add 0 for proper spacing
                else if newMin < 10 && newSec < 10
                {
                    let newText = "\(String(newHour!)):0\(String(newMin!)):0\(String(newSec))"
                    return newText
                }
                
                // otherwise, the min and sec are > 10, so no additional 0
                else
                {
                    let newText = "\(String(newHour!)):\(String(newMin!)):\(String(newSec))"
                    return newText
                }
            }
            else if newMSec == nil && newHour == nil {
                // if the sec is <10, add proper spacing
                if newSec < 10
                {
                    let newText = "\(String(newMin!)):0\(String(newSec))"
                    return newText
                    
                }
                else if newSec >= 10
                {
                    let newText = "\(String(newMin!)):\(String(newSec))"
                    return newText
                    
                }
            }
            else if newMSec != nil {
                // if MSec <10, add proper spacing
                if newMSec < 10
                {
                    let newText = "\(String(newSec)).0\(String(newMSec!))"
                    return newText
                    
                }
                else if newMSec >= 10
                {
                    let newText = "\(String(newSec)).\(String(newMSec!))"
                    return newText
                }
            }
            // function is expected to return string. Should never reach this point.
            return ""
        }
        
        
        // Store the data in a new section in next tab (TODO)
        //pacesData.extend(distance: distanceDisplay, time: timeDisplay)
        
        // Create variables that switch from strings to ints
        let userHoursInt = Int(userHours)!
        let userMinutesInt = Int(userMinutes)!
        let userSecondsInt = Int(userSeconds)!
        let userDistInt = Int(userDist)!

        // initialize variables to display on display page
        
        // calculate total number of seconds
        let totalTime: Int = userHoursInt * 60 * 60 + userMinutesInt * 60 + userSecondsInt
        
        // Based on unit of measure that user chooses
        if userUnitOfMeasure == "Mile" {
            // calcs for marathon pace
            let marTime = Double(totalTime) * 26.21876 / Double(userDistInt)
            let marHour = Int(marTime / 3600)
            let marMin = Int((marTime - Double(marHour * 3600)) / 60)
            let marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            // send info to the appDelegate so that they can be displayed in pacesviewcontroller
            appDelegate.marText = standardizeDisplay(nil, newSec: marSec, newMin: marMin, newHour: marHour)
            
            // calcs for halfmarathon pace
            let halfmarTime = Double(totalTime) * 13.10938 / Double(userDistInt)
            let halfmarHour = Int(halfmarTime / 3600)
            let halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            let halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // send info to the appDelegate so that they can be displayed in pacesviewcontroller
            appDelegate.halfmarText = standardizeDisplay(nil, newSec: halfmarSec, newMin: halfmarMin, newHour: halfmarHour)
            
            // calcs for tenK pace
            let tenKTime = Double(totalTime) * 6.21371 / Double(userDistInt)
            let tenKMin = Int(tenKTime / 60)
            let tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            appDelegate.tenKText = standardizeDisplay(nil, newSec: tenKSec, newMin: tenKMin, newHour: nil)
            
            // calcs for fiveK pace
            let fiveKTime = Double(totalTime) * 3.10686 / Double(userDistInt)
            let fiveKMin = Int(fiveKTime / 60)
            let fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            appDelegate.fiveKText = standardizeDisplay(nil, newSec: fiveKSec, newMin: fiveKMin, newHour: nil)
            
            // calcs for threeK pace
            let threeKTime = Double(totalTime) * 1.86411 / Double(userDistInt)
            let threeKMin = Int(threeKTime / 60)
            let threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            appDelegate.threeKText = standardizeDisplay(nil, newSec: threeKSec, newMin: threeKMin, newHour: nil)
            
            // calcs for mile pace
            let mileTime = Double(totalTime) / Double(userDistInt)
            let mileMin = Int(mileTime / 60)
            let mileSec = Int(Double(mileTime) - Double(mileMin * 60))
            
            appDelegate.mileText = standardizeDisplay(nil, newSec: mileSec, newMin: mileMin, newHour: nil)
            
            // calcs for 1600m pace
            let sixteenhunTime = Double(totalTime) * 0.9941939 / Double(userDistInt)
            let sixteenhunMin = Int(sixteenhunTime / 60)
            let sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            appDelegate.sixteenhunText = standardizeDisplay(nil, newSec: sixteenhunSec, newMin: sixteenhunMin, newHour: nil)

            // calcs for 1200m pace
            let twelvehunTime = Double(totalTime) * 0.7456454 / Double(userDistInt)
            let twelvehunMin = Int(twelvehunTime / 60)
            let twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            appDelegate.twelvehunText = standardizeDisplay(nil, newSec: twelvehunSec, newMin: twelvehunMin, newHour: nil)
            
            // calcs for 1k pace
            let oneKTime = Double(totalTime) * 0.621371 / Double(userDistInt)
            let oneKMin = Int(oneKTime / 60)
            let oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            appDelegate.oneKText = standardizeDisplay(nil, newSec: oneKSec, newMin: oneKMin, newHour: nil)
            
            // calcs for 800m pace
            let eighthunTime = Double(totalTime) * 0.497097 / Double(userDistInt)
            let eighthunMin = Int(eighthunTime / 60)
            let eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            appDelegate.eighthunText = standardizeDisplay(nil, newSec: eighthunSec, newMin: eighthunMin, newHour: nil)
            
            // calcs for 400m pace
            let fourhunTime = Double(totalTime) * 0.248548 / Double(userDistInt)
            let fourhunSec = Int(fourhunTime)
            let fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
            appDelegate.fourhunText = standardizeDisplay(fourhunMSec, newSec: fourhunSec, newMin: nil, newHour: nil)
            
            // calcs for 200m pace
            let twohunTime = Double(totalTime) * 0.124274 / Double(userDistInt)
            let twohunSec = Int(twohunTime)
            let twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            appDelegate.twohunText = standardizeDisplay(twohunMSec, newSec: twohunSec, newMin: nil, newHour: nil)
            
            // calcs for 100m pace
            let onehunTime = Double(totalTime) * 0.0621371 / Double(userDistInt)
            let onehunSec = Int(onehunTime)
            let onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            appDelegate.onehunText = standardizeDisplay(onehunMSec, newSec: onehunSec, newMin: nil, newHour: nil)
        }
            
        else if userUnitOfMeasure == "Kilometer" {
            // calcs for marathon pace
            let marTime = Double(totalTime) * 42.195 / Double(userDistInt)
            let marHour = Int(marTime / 3600)
            let marMin = Int((marTime - Double(marHour * 3600)) / 60)
            let marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            // send info to the appDelegate so that they can be displayed in pacesviewcontroller
            appDelegate.marText = standardizeDisplay(nil, newSec: marSec, newMin: marMin, newHour: marHour)
            
            // calcs for halfmarathon pace
            let halfmarTime = Double(totalTime) * 21.0975 / Double(userDistInt)
            let halfmarHour = Int(halfmarTime / 3600)
            let halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            let halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // send info to the appDelegate so that they can be displayed in pacesviewcontroller
            appDelegate.halfmarText = standardizeDisplay(nil, newSec: halfmarSec, newMin: halfmarMin, newHour: halfmarHour)
            
            // calcs for tenK pace
            let tenKTime = Double(totalTime) * 10 / Double(userDistInt)
            let tenKMin = Int(tenKTime / 60)
            let tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            appDelegate.tenKText = standardizeDisplay(nil, newSec: tenKSec, newMin: tenKMin, newHour: nil)
            
            // calcs for fiveK pace
            let fiveKTime = Double(totalTime) * 5 / Double(userDistInt)
            let fiveKMin = Int(fiveKTime / 60)
            let fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            appDelegate.fiveKText = standardizeDisplay(nil, newSec: fiveKSec, newMin: fiveKMin, newHour: nil)
            
            // calcs for threeK pace
            let threeKTime = Double(totalTime) * 3 / Double(userDistInt)
            let threeKMin = Int(threeKTime / 60)
            let threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            appDelegate.threeKText = standardizeDisplay(nil, newSec: threeKSec, newMin: threeKMin, newHour: nil)
            
            // calcs for mile pace
            let mileTime = Double(totalTime) * 1.60934 / Double(userDistInt)
            let mileMin = Int(mileTime / 60)
            let mileSec = Int(mileTime - Double(mileMin * 60))
            
            appDelegate.mileText = standardizeDisplay(nil, newSec: mileSec, newMin: mileMin, newHour: nil)
            
            // calcs for 1600m pace
            let sixteenhunTime = Double(totalTime) * 1.6 / Double(userDistInt)
            let sixteenhunMin = Int(sixteenhunTime / 60)
            let sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            appDelegate.sixteenhunText = standardizeDisplay(nil, newSec: sixteenhunSec, newMin: sixteenhunMin, newHour: nil)
            
            // calcs for 1200m pace
            let twelvehunTime = Double(totalTime) * 1.2 / Double(userDistInt)
            let twelvehunMin = Int(twelvehunTime / 60)
            let twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            appDelegate.twelvehunText = standardizeDisplay(nil, newSec: twelvehunSec, newMin: twelvehunMin, newHour: nil)
            
            // calcs for 1k pace
            let oneKTime = Double(totalTime) / Double(userDistInt)
            let oneKMin = Int(oneKTime / 60)
            let oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            appDelegate.oneKText = standardizeDisplay(nil, newSec: oneKSec, newMin: oneKMin, newHour: nil)
            
            // calcs for 800m pace
            let eighthunTime = Double(totalTime) * 0.8 / Double(userDistInt)
            let eighthunMin = Int(eighthunTime / 60)
            let eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            appDelegate.eighthunText = standardizeDisplay(nil, newSec: eighthunSec, newMin: eighthunMin, newHour: nil)
            
            // calcs for 400m pace
            let fourhunTime = Double(totalTime) * 0.4 / Double(userDistInt)
            let fourhunSec = Int(fourhunTime)
            let fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
           appDelegate.fourhunText = standardizeDisplay(fourhunMSec, newSec: fourhunSec, newMin: nil, newHour: nil)
            
            // calcs for 200m pace
            let twohunTime = Double(totalTime) * 0.2 / Double(userDistInt)
            let twohunSec = Int(twohunTime)
            let twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            appDelegate.twohunText = standardizeDisplay(twohunMSec, newSec: twohunSec, newMin: nil, newHour: nil)
            
            // calcs for 100m pace
            let onehunTime = Double(totalTime) * 0.1 / Double(userDistInt)
            let onehunSec = Int(onehunTime)
            let onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            appDelegate.onehunText = standardizeDisplay(onehunMSec, newSec: onehunSec, newMin: nil, newHour: nil)
        }
        else if userUnitOfMeasure == "Meters"
        {
            // calcs for marathon pace
            let marTime = Double(totalTime) * 42195 / Double(userDistInt)
            let marHour = Int(marTime / 3600)
            let marMin = Int((marTime - Double(marHour * 3600)) / 60)
            let marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            appDelegate.marText = standardizeDisplay(nil, newSec: marSec, newMin: marMin, newHour: marHour)
            
            // calcs for halfmarathon pace
            let halfmarTime = Double(totalTime) * 21097.5 / Double(userDistInt)
            let halfmarHour = Int(halfmarTime / 3600)
            let halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            let halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // send info to the appDelegate so that they can be displayed in pacesviewcontroller
            appDelegate.halfmarText = standardizeDisplay(nil, newSec: halfmarSec, newMin: halfmarMin, newHour: halfmarHour)
            
            // calcs for tenK pace
            let tenKTime = Double(totalTime) * 10000 / Double(userDistInt)
            let tenKMin = Int(tenKTime / 60)
            let tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            appDelegate.tenKText = standardizeDisplay(nil, newSec: tenKSec, newMin: tenKMin, newHour: nil)
            
            // calcs for fiveK pace
            let fiveKTime = Double(totalTime) * 5000 / Double(userDistInt)
            let fiveKMin = Int(fiveKTime / 60)
            let fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            appDelegate.fiveKText = standardizeDisplay(nil, newSec: fiveKSec, newMin: fiveKMin, newHour: nil)
            
            // calcs for threeK pace
            let threeKTime = Double(totalTime) * 3000 / Double(userDistInt)
            let threeKMin = Int(threeKTime / 60)
            let threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            appDelegate.threeKText = standardizeDisplay(nil, newSec: threeKSec, newMin: threeKMin, newHour: nil)
            
            // calcs for mile pace
            let mileTime = Double(totalTime) * 1609.34 / Double(userDistInt)
            let mileMin = Int(mileTime / 60)
            let mileSec = Int(mileTime - Double(mileMin * 60))
            
            appDelegate.mileText = standardizeDisplay(nil, newSec: mileSec, newMin: mileMin, newHour: nil)
            
            // calcs for 1600m pace
            let sixteenhunTime = Double(totalTime) * 1600 / Double(userDistInt)
            let sixteenhunMin = Int(sixteenhunTime / 60)
            let sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            appDelegate.sixteenhunText = standardizeDisplay(nil, newSec: sixteenhunSec, newMin: sixteenhunMin, newHour: nil)
            
            // calcs for 1200m pace
            let twelvehunTime = Double(totalTime) * 1200 / Double(userDistInt)
            let twelvehunMin = Int(twelvehunTime / 60)
            let twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            appDelegate.twelvehunText = standardizeDisplay(nil, newSec: twelvehunSec, newMin: twelvehunMin, newHour: nil)
            
            // calcs for 1k pace
            let oneKTime = Double(totalTime) * 1000 / Double(userDistInt)
            let oneKMin = Int(oneKTime / 60)
            let oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            appDelegate.oneKText = standardizeDisplay(nil, newSec: oneKSec, newMin: oneKMin, newHour: nil)
            
            // calcs for 800m pace
            let eighthunTime = Double(totalTime) * 800 / Double(userDistInt)
            let eighthunMin = Int(eighthunTime / 60)
            let eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            appDelegate.eighthunText = standardizeDisplay(nil, newSec: eighthunSec, newMin: eighthunMin, newHour: nil)
            
            // calcs for 400m pace
            let fourhunTime = Double(totalTime) * 400 / Double(userDistInt)
            let fourhunSec = Int(fourhunTime)
            let fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
            appDelegate.fourhunText = standardizeDisplay(fourhunMSec, newSec: fourhunSec, newMin: nil, newHour: nil)
            
            // calcs for 200m pace
            let twohunTime = Double(totalTime) * 200 / Double(userDistInt)
            let twohunSec = Int(twohunTime)
            let twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            appDelegate.twohunText = standardizeDisplay(twohunMSec, newSec: twohunSec, newMin: nil, newHour: nil)
            
            // calcs for 100m pace
            let onehunTime = Double(totalTime) * 100 / Double(userDistInt)
            let onehunSec = Int(onehunTime)
            let onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            appDelegate.onehunText = standardizeDisplay(onehunMSec, newSec: onehunSec, newMin: nil, newHour: nil)
        }
        else if userUnitOfMeasure == "Marathon"
        {
            // calcs for marathon pace
            let marTime = Double(totalTime) / Double(userDistInt)
            let marHour = Int(marTime / 3600)
            let marMin = Int((marTime - Double(marHour * 3600)) / 60)
            let marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            appDelegate.marText = standardizeDisplay(nil, newSec: marSec, newMin: marMin, newHour: marHour)
            
            // calcs for halfmarathon pace
            let halfmarTime = Double(totalTime) * 0.5 / Double(userDistInt)
            let halfmarHour = Int(halfmarTime / 3600)
            let halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            let halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // send info to the appDelegate so that they can be displayed in pacesviewcontroller
            appDelegate.halfmarText = standardizeDisplay(nil, newSec: halfmarSec, newMin: halfmarMin, newHour: halfmarHour)
            
            
            // calcs for tenK pace
            let tenKTime = Double(totalTime) * 0.236995 / Double(userDistInt)
            let tenKMin = Int(tenKTime / 60)
            let tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            appDelegate.tenKText = standardizeDisplay(nil, newSec: tenKSec, newMin: tenKMin, newHour: nil)
            
            // calcs for fiveK pace
            let fiveKTime = Double(totalTime) * 0.118497 / Double(userDistInt)
            let fiveKMin = Int(fiveKTime / 60)
            let fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            appDelegate.fiveKText = standardizeDisplay(nil, newSec: fiveKSec, newMin: fiveKMin, newHour: nil)
            
            // calcs for threeK pace
            let threeKTime = Double(totalTime) * 0.0710985 / Double(userDistInt)
            let threeKMin = Int(threeKTime / 60)
            let threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            appDelegate.threeKText = standardizeDisplay(nil, newSec: threeKSec, newMin: threeKMin, newHour: nil)
            
            // calcs for mile pace
            let mileTime = Double(totalTime) * 0.0381406 / Double(userDistInt)
            let mileMin = Int(mileTime / 60)
            let mileSec = Int(mileTime - Double(mileMin * 60))
            
            appDelegate.mileText = standardizeDisplay(nil, newSec: mileSec, newMin: mileMin, newHour: nil)
            
            // calcs for 1600m pace
            let sixteenhunTime = Double(totalTime) * 0.03791918 / Double(userDistInt)
            let sixteenhunMin = Int(sixteenhunTime / 60)
            let sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            appDelegate.sixteenhunText = standardizeDisplay(nil, newSec: sixteenhunSec, newMin: sixteenhunMin, newHour: nil)
            
            // calcs for 1200m pace
            let twelvehunTime = Double(totalTime) * 0.02843939 / Double(userDistInt)
            let twelvehunMin = Int(twelvehunTime / 60)
            let twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            appDelegate.twelvehunText = standardizeDisplay(nil, newSec: twelvehunSec, newMin: twelvehunMin, newHour: nil)
            
            // calcs for 1k pace
            let oneKTime = Double(totalTime) * 0.0236995 / Double(userDistInt)
            let oneKMin = Int(oneKTime / 60)
            let oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            appDelegate.oneKText = standardizeDisplay(nil, newSec: oneKSec, newMin: oneKMin, newHour: nil)
            
            // calcs for 800m pace
            let eighthunTime = Double(totalTime) * 0.0189596 / Double(userDistInt)
            let eighthunMin = Int(eighthunTime / 60)
            let eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            appDelegate.eighthunText = standardizeDisplay(nil, newSec: eighthunSec, newMin: eighthunMin, newHour: nil)
            
            // calcs for 400m pace
            let fourhunTime = Double(totalTime) * 0.0094798 / Double(userDistInt)
            let fourhunSec = Int(fourhunTime)
            let fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
            appDelegate.fourhunText = standardizeDisplay(fourhunMSec, newSec: fourhunSec, newMin: nil, newHour: nil)
            
            // calcs for 200m pace
            let twohunTime = Double(totalTime) * 0.0047399 / Double(userDistInt)
            let twohunSec = Int(twohunTime)
            let twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            appDelegate.twohunText = standardizeDisplay(twohunMSec, newSec: twohunSec, newMin: nil, newHour: nil)
            
            // calcs for 100m pace
            let onehunTime = Double(totalTime) * 0.00236995 / Double(userDistInt)
            let onehunSec = Int(onehunTime)
            let onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            appDelegate.onehunText = standardizeDisplay(onehunMSec, newSec: onehunSec, newMin: nil, newHour: nil)
        }
    }
}
    
    
    


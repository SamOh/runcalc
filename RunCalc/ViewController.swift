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
        
        // take into account specific cases when user doesn't move pickerview
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
        

//        // Abstraction: function to calculate time
//        let newTime = Double(time) * 26.21876 / Double(distance)
//        let
//        
//        let fun calc_time (time: int) (distance: int) =
//        let newTime = Double(time) * 26.21876 / Double(distance) in
//                let newHour = Int(newTime / 3600) in
//                let newMin = Int((newTime - Double(newHour * 3600)) / 60) in
//                var newSec = Int(newTime - Double(newHour * 3600) - Double(newMin * 60)) in
//        
//        // if the min is less than 10, add 0 for proper spacing
//        if newMin < 10 && newSec > 10
//        {
//            newText = "\(String(newHour)):0\(String(newMin)):\(String(newSec))"
//        }
//            
//            // if the sec is less than 10, add 0 for proper spacing
//        else if marSec < 10 && marMin > 10
//        {
//            newText = "\(String(newHour)):\(String(newMin)):0\(String(newSec))"
//        }
//            
//            // if min <10 and sec <10 add 0 for proper spacing
//        else if newMin < 10 && newSec < 10
//        {
//            newText = "\(String(newHour)):0\(String(newMin)):0\(String(newSec))"
//        }
//            
//            // if min and sec are > 10, no additional 0
//        else if newMin > 10 && newSec > 10
//        {
//            newText = "\(String(newHour)):\(String(newMin)):\(String(newSec))"
//        }
//        
//        
//        //REMEMBER TO PUT THIS CODE IN EACH PLACE
//        appDelegate.marText = marText
//        
//        //PacesViewController.Distance = distanceDisplay
//        
//        // Store the data in a new section in next tab
//        //pacesData.extend(distance: distanceDisplay, time: timeDisplay)
//        
//        // Create variables that switch from strings to ints
//        var userHoursInt = userHours.Int()!
//        var userMinutesInt = userMinutes.Int()!
//        var userSecondsInt = userSeconds.Int()!
//        var userDistInt = userDist.Int()!

        // initialize variables to display on display page
        
        // calculate total number of seconds
        let totalTime: Int = userHoursInt * 60 * 60 + userMinutesInt * 60 + userSecondsInt
        
        // Based on unit of measure that user chooses
        if userUnitOfMeasure == "Mile"
        {
            // calcs for marathon pace
            var marTime = Double(totalTime) * 26.21876 / Double(userDistInt)
            var marHour = Int(marTime / 3600)
            var marMin = Int((marTime - Double(marHour * 3600)) / 60)
            var marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if marMin < 10 && marSec > 10
            {
                  marText = "\(String(marHour)):0\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
                
            }
                
            // if the sec is less than 10, add 0 for proper spacing
            else if marSec < 10 && marMin > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
            }
                
            // if min <10 and sec <10 add 0 for proper spacing
            else if marMin < 10 && marSec < 10
            {
                marText = "\(String(marHour)):0\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
            }
                
            // if min and sec are > 10, no additional 0
            else if marMin > 10 && marSec > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
            }
            
            
            // calcs for halfmarathon pace
            var halfmarTime = Double(totalTime) * 13.10938 / Double(userDistInt)
            var halfmarHour = Int(halfmarTime / 3600)
            var halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            var halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if halfmarMin < 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
            }
                
                // if the sec is less than 10, add 0 for proper spacing
            else if halfmarSec < 10 && halfmarMin > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
            }
                
                // if min <10 and sec <10 add 0 for proper spacing
            else if halfmarMin < 10 && halfmarSec < 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
                
            }
                
                // if min and sec are > 10, no additional 0
            else if halfmarMin > 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
                
            }
            
            
            // calcs for tenK pace
            var tenKTime = Double(totalTime) * 6.21371 / Double(userDistInt)
            var tenKMin = Int(tenKTime / 60)
            var tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if tenKSec < 10
            {
                tenKText = "\(String(tenKMin)):0\(String(tenKSec))"
                appDelegate.tenKText = tenKText
                
            }
            else if tenKSec >= 10
            {
                tenKText = "\(String(tenKMin)):\(String(tenKSec))"
                appDelegate.tenKText = tenKText
                
            }
            
            
            // calcs for fiveK pace
            var fiveKTime = Double(totalTime) * 3.10686 / Double(userDistInt)
            var fiveKMin = Int(fiveKTime / 60)
            var fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if fiveKSec < 10
            {
                fiveKText = "\(String(fiveKMin)):0\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
                
            }
            else if fiveKSec >= 10
            {
                fiveKText = "\(String(fiveKMin)):\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
                
            }

            
            // calcs for threeK pace
            var threeKTime = Double(totalTime) * 1.86411 / Double(userDistInt)
            var threeKMin = Int(threeKTime / 60)
            var threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if threeKSec < 10
            {
                threeKText = "\(String(threeKMin)):0\(String(threeKSec))"
                appDelegate.threeKText = threeKText
                
            }
            else if threeKSec >= 10
            {
                threeKText = "\(String(threeKMin)):\(String(threeKSec))"
                appDelegate.threeKText = threeKText
                
            }
            
            
            // calcs for mile pace
            var mileTime = Double(totalTime) / Double(userDistInt)
            var mileMin = Int(mileTime / 60)
            var mileSec = Int(Double(mileTime) - Double(mileMin * 60))
            
            // if the sec is < 10, add proper spacing
            if mileSec < 10
            {
                mileText = "\(String(mileMin)):0\(String(mileSec))"
                appDelegate.mileText = mileText
                
            }
            else if mileSec >= 10
            {
                mileText = "\(String(mileMin)):\(String(mileSec))"
                appDelegate.mileText = mileText
                
            }
        
            
            // calcs for 1600m pace
            var sixteenhunTime = Double(totalTime) * 0.9941939 / Double(userDistInt)
            var sixteenhunMin = Int(sixteenhunTime / 60)
            var sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            // if the sec is < 10, add proper spacing
            if sixteenhunSec < 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):0\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
                
            }
            else if sixteenhunSec >= 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
                
            }
            
            
            // calcs for 1200m pace
            var twelvehunTime = Double(totalTime) * 0.7456454 / Double(userDistInt)
            var twelvehunMin = Int(twelvehunTime / 60)
            var twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            // if the sec is <10, add proper spacing
            if twelvehunSec < 10
            {
                twelvehunText = "\(String(twelvehunMin)):0\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
                
            }
            else if twelvehunSec >= 10
            {
                twelvehunText = "\(String(twelvehunMin)):\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
                
            }
            
            
            // calcs for 1k pace
            var oneKTime = Double(totalTime) * 0.621371 / Double(userDistInt)
            var oneKMin = Int(oneKTime / 60)
            var oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if oneKSec < 10
            {
                oneKText = "\(String(oneKMin)):0\(String(oneKSec))"
                appDelegate.oneKText = oneKText
            }
            else if oneKSec >= 10
            {
                oneKText = "\(String(oneKMin)):\(String(oneKSec))"
                appDelegate.oneKText = oneKText
            }

            
            // calcs for 800m pace
            var eighthunTime = Double(totalTime) * 0.497097 / Double(userDistInt)
            var eighthunMin = Int(eighthunTime / 60)
            var eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            // if the sec is <10, add proper spacing
            if eighthunSec < 10
            {
                eighthunText = "\(String(eighthunMin)):0\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
                
            }
            else if eighthunSec >= 10
            {
                eighthunText = "\(String(eighthunMin)):\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
                
            }
            
            
            // calcs for 400m pace
            var fourhunTime = Double(totalTime) * 0.248548 / Double(userDistInt)
            var fourhunSec = Int(fourhunTime)
            var fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if fourhunMSec < 10
            {
                fourhunText = "\(String(fourhunSec)).0\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
                
            }
            else if fourhunMSec >= 10
            {
                fourhunText = "\(String(fourhunSec)).\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
                
            }
            
            
            // calcs for 200m pace
            var twohunTime = Double(totalTime) * 0.124274 / Double(userDistInt)
            var twohunSec = Int(twohunTime)
            var twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if twohunMSec < 10
            {
                twohunText = "\(String(twohunSec)).0\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
                
            }
            else if twohunMSec >= 10
            {
                twohunText = "\(String(twohunSec)).\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
                
            }
            
            
            // calcs for 100m pace
            var onehunTime = Double(totalTime) * 0.0621371 / Double(userDistInt)
            var onehunSec = Int(onehunTime)
            var onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if onehunMSec < 10
            {
                onehunText = "\(String(onehunSec)).0\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
                
            }
            else if onehunMSec >= 10
            {
                onehunText = "\(String(onehunSec)).\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
                
            }
        }
            
        else if userUnitOfMeasure == "Kilometer"
        {
            // calcs for marathon pace
            var marTime = Double(totalTime) * 42.195 / Double(userDistInt)
            var marHour = Int(marTime / 3600)
            var marMin = Int((marTime - Double(marHour * 3600)) / 60)
            var marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if marMin < 10 && marSec > 10
            {
                marText = "\(String(marHour)):0\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if the sec is less than 10, add 0 for proper spacing
            else if marSec < 10 && marMin > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if min <10 and sec <10 add 0 for proper spacing
            else if marMin < 10 && marSec < 10
            {
                marText = "\(String(marHour)):0\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if min and sec are > 10, no additional 0
            else if marMin > 10 && marSec > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
    
            }
            
            
            // calcs for halfmarathon pace
            var halfmarTime = Double(totalTime) * 21.0975 / Double(userDistInt)
            var halfmarHour = Int(halfmarTime / 3600)
            var halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            var halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if halfmarMin < 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if the sec is less than 10, add 0 for proper spacing
            else if halfmarSec < 10 && halfmarMin > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if min <10 and sec <10 add 0 for proper spacing
            else if halfmarMin < 10 && halfmarSec < 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if min and sec are > 10, no additional 0
            else if halfmarMin > 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
            
            
            // calcs for tenK pace
            var tenKTime = Double(totalTime) * 10 / Double(userDistInt)
            var tenKMin = Int(tenKTime / 60)
            var tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if tenKSec < 10
            {
                tenKText = "\(String(tenKMin)):0\(String(tenKSec))"
                appDelegate.tenKText = tenKText
    
            }
            else if tenKSec >= 10
            {
                tenKText = "\(String(tenKMin)):\(String(tenKSec))"
                appDelegate.tenKText = tenKText
    
            }
            
            
            // calcs for fiveK pace
            var fiveKTime = Double(totalTime) * 5 / Double(userDistInt)
            var fiveKMin = Int(fiveKTime / 60)
            var fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if fiveKSec < 10
            {
                fiveKText = "\(String(fiveKMin)):0\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
    
            }
            else if fiveKSec >= 10
            {
                fiveKText = "\(String(fiveKMin)):\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
    
            }
            
            
            // calcs for threeK pace
            var threeKTime = Double(totalTime) * 3 / Double(userDistInt)
            var threeKMin = Int(threeKTime / 60)
            var threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if threeKSec < 10
            {
                threeKText = "\(String(threeKMin)):0\(String(threeKSec))"
                appDelegate.threeKText = threeKText
    
            }
            else if threeKSec >= 10
            {
                threeKText = "\(String(threeKMin)):\(String(threeKSec))"
                appDelegate.threeKText = threeKText
    
            }
            
            
            // calcs for mile pace
            var mileTime = Double(totalTime) * 1.60934 / Double(userDistInt)
            var mileMin = Int(mileTime / 60)
            var mileSec = Int(mileTime - Double(mileMin * 60))
            
            // if the sec is < 10, add proper spacing
            if mileSec < 10
            {
                mileText = "\(String(mileMin)):0\(String(mileSec))"
                appDelegate.mileText = mileText
    
            }
            else if mileSec >= 10
            {
                mileText = "\(String(mileMin)):\(String(mileSec))"
                appDelegate.mileText = mileText
    
            }
            
            
            // calcs for 1600m pace
            var sixteenhunTime = Double(totalTime) * 1.6 / Double(userDistInt)
            var sixteenhunMin = Int(sixteenhunTime / 60)
            var sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            // if the sec is < 10, add proper spacing
            if sixteenhunSec < 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):0\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
    
            }
            else if sixteenhunSec >= 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
    
            }
            
            
            // calcs for 1200m pace
            var twelvehunTime = Double(totalTime) * 1.2 / Double(userDistInt)
            var twelvehunMin = Int(twelvehunTime / 60)
            var twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            if twelvehunSec < 10
            {
                twelvehunText = "\(String(twelvehunMin)):0\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
    
            }
            else if twelvehunSec >= 10
            {
                twelvehunText = "\(String(twelvehunMin)):\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
    
            }
            
            
            // calcs for 1k pace
            var oneKTime = Double(totalTime) / Double(userDistInt)
            var oneKMin = Int(oneKTime / 60)
            var oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if oneKSec < 10
            {
                oneKText = "\(String(oneKMin)):0\(String(oneKSec))"
                appDelegate.oneKText = oneKText
    
            }
            else if oneKSec >= 10
            {
                oneKText = "\(String(oneKMin)):\(String(oneKSec))"
                appDelegate.oneKText = oneKText
    
            }
            
            
            // calcs for 800m pace
            var eighthunTime = Double(totalTime) * 0.8 / Double(userDistInt)
            var eighthunMin = Int(eighthunTime / 60)
            var eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            // if the sec is <10, add proper spacing
            if eighthunSec < 10
            {
                eighthunText = "\(String(eighthunMin)):0\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
    
            }
            else if eighthunSec >= 10
            {
                eighthunText = "\(String(eighthunMin)):\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
    
            }
            
            
            // calcs for 400m pace
            var fourhunTime = Double(totalTime) * 0.4 / Double(userDistInt)
            var fourhunSec = Int(fourhunTime)
            var fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if fourhunMSec < 10
            {
                fourhunText = "\(String(fourhunSec)).0\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
    
            }
            else if fourhunMSec >= 10
            {
                fourhunText = "\(String(fourhunSec)).\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
    
            }
            
            
            // calcs for 200m pace
            var twohunTime = Double(totalTime) * 0.2 / Double(userDistInt)
            var twohunSec = Int(twohunTime)
            var twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if twohunMSec < 10
            {
                twohunText = "\(String(twohunSec)).0\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
    
            }
            else if twohunMSec >= 10
            {
                twohunText = "\(String(twohunSec)).\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
    
            }
            
            
            // calcs for 100m pace
            var onehunTime = Double(totalTime) * 0.1 / Double(userDistInt)
            var onehunSec = Int(onehunTime)
            var onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if onehunMSec < 10
            {
                onehunText = "\(String(onehunSec)).0\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
    
            }
            else if onehunMSec >= 10
            {
                onehunText = "\(String(onehunSec)).\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
    
            }
        }
        else if userUnitOfMeasure == "Meters"
        {
            // calcs for marathon pace
            var marTime = Double(totalTime) * 42195 / Double(userDistInt)
            var marHour = Int(marTime / 3600)
            var marMin = Int((marTime - Double(marHour * 3600)) / 60)
            var marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if marMin < 10 && marSec > 10
            {
                marText = "\(String(marHour)):0\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if the sec is less than 10, add 0 for proper spacing
            else if marSec < 10 && marMin > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if min <10 and sec <10 add 0 for proper spacing
            else if marMin < 10 && marSec < 10
            {
                marText = "\(String(marHour)):0\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if min and sec are > 10, no additional 0
            else if marMin > 10 && marSec > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
    
            }
            
            // calcs for halfmarathon pace
            var halfmarTime = Double(totalTime) * 21097.5 / Double(userDistInt)
            var halfmarHour = Int(halfmarTime / 3600)
            var halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            var halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if halfmarMin < 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if the sec is less than 10, add 0 for proper spacing
            else if halfmarSec < 10 && halfmarMin > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if min <10 and sec <10 add 0 for proper spacing
            else if halfmarMin < 10 && halfmarSec < 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if min and sec are > 10, no additional 0
            else if halfmarMin > 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
            
            
            // calcs for tenK pace
            var tenKTime = Double(totalTime) * 10000 / Double(userDistInt)
            var tenKMin = Int(tenKTime / 60)
            var tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if tenKSec < 10
            {
                tenKText = "\(String(tenKMin)):0\(String(tenKSec))"
                appDelegate.tenKText = tenKText
    
            }
            else if tenKSec >= 10
            {
                tenKText = "\(String(tenKMin)):\(String(tenKSec))"
                appDelegate.tenKText = tenKText
    
            }
            
            
            // calcs for fiveK pace
            var fiveKTime = Double(totalTime) * 5000 / Double(userDistInt)
            var fiveKMin = Int(fiveKTime / 60)
            var fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if fiveKSec < 10
            {
                fiveKText = "\(String(fiveKMin)):0\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
    
            }
            else if fiveKSec >= 10
            {
                fiveKText = "\(String(fiveKMin)):\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
    
            }
            
            
            // calcs for threeK pace
            var threeKTime = Double(totalTime) * 3000 / Double(userDistInt)
            var threeKMin = Int(threeKTime / 60)
            var threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if threeKSec < 10
            {
                threeKText = "\(String(threeKMin)):0\(String(threeKSec))"
                appDelegate.threeKText = threeKText
    
            }
            else if threeKSec >= 10
            {
                threeKText = "\(String(threeKMin)):\(String(threeKSec))"
                appDelegate.threeKText = threeKText
    
            }
            
            
            // calcs for mile pace
            var mileTime = Double(totalTime) * 1609.34 / Double(userDistInt)
            var mileMin = Int(mileTime / 60)
            var mileSec = Int(mileTime - Double(mileMin * 60))
            
            // if the sec is < 10, add proper spacing
            if mileSec < 10
            {
                mileText = "\(String(mileMin)):0\(String(mileSec))"
                appDelegate.mileText = mileText
    
            }
            else if mileSec >= 10
            {
                mileText = "\(String(mileMin)):\(String(mileSec))"
                appDelegate.mileText = mileText
    
            }
            
            
            // calcs for 1600m pace
            var sixteenhunTime = Double(totalTime) * 1600 / Double(userDistInt)
            var sixteenhunMin = Int(sixteenhunTime / 60)
            var sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            // if the sec is < 10, add proper spacing
            if sixteenhunSec < 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):0\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
    
            }
            else if sixteenhunSec >= 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
    
            }
            
            
            // calcs for 1200m pace
            var twelvehunTime = Double(totalTime) * 1200 / Double(userDistInt)
            var twelvehunMin = Int(twelvehunTime / 60)
            var twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            if twelvehunSec < 10
            {
                twelvehunText = "\(String(twelvehunMin)):0\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
    
            }
            else if twelvehunSec >= 10
            {
                twelvehunText = "\(String(twelvehunMin)):\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
    
            }
            
            
            // calcs for 1k pace
            var oneKTime = Double(totalTime) * 1000 / Double(userDistInt)
            var oneKMin = Int(oneKTime / 60)
            var oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if oneKSec < 10
            {
                oneKText = "\(String(oneKMin)):0\(String(oneKSec))"
                appDelegate.oneKText = oneKText
    
            }
            else if oneKSec >= 10
            {
                oneKText = "\(String(oneKMin)):\(String(oneKSec))"
                appDelegate.oneKText = oneKText
    
            }
            
            
            // calcs for 800m pace
            var eighthunTime = Double(totalTime) * 800 / Double(userDistInt)
            var eighthunMin = Int(eighthunTime / 60)
            var eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            // if the sec is <10, add proper spacing
            if eighthunSec < 10
            {
                eighthunText = "\(String(eighthunMin)):0\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
    
            }
            else if eighthunSec >= 10
            {
                eighthunText = "\(String(eighthunMin)):\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
    
            }
            
            
            // calcs for 400m pace
            var fourhunTime = Double(totalTime) * 400 / Double(userDistInt)
            var fourhunSec = Int(fourhunTime)
            var fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if fourhunMSec < 10
            {
                fourhunText = "\(String(fourhunSec)).0\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
    
            }
            else if fourhunMSec >= 10
            {
                fourhunText = "\(String(fourhunSec)).\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
    
            }
            
            
            // calcs for 200m pace
            var twohunTime = Double(totalTime) * 200 / Double(userDistInt)
            var twohunSec = Int(twohunTime)
            var twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if twohunMSec < 10
            {
                twohunText = "\(String(twohunSec)).0\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
    
            }
            else if twohunMSec >= 10
            {
                twohunText = "\(String(twohunSec)).\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
    
            }
            
            
            // calcs for 100m pace
            var onehunTime = Double(totalTime) * 100 / Double(userDistInt)
            var onehunSec = Int(onehunTime)
            var onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if onehunMSec < 10
            {
                onehunText = "\(String(onehunSec)).0\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
    
            }
            else if onehunMSec >= 10
            {
                onehunText = "\(String(onehunSec)).\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
    
            }

        }
        else if userUnitOfMeasure == "Marathon"
        {
            // calcs for marathon pace
            var marTime = Double(totalTime) / Double(userDistInt)
            var marHour = Int(marTime / 3600)
            var marMin = Int((marTime - Double(marHour * 3600)) / 60)
            var marSec = Int(marTime - Double(marHour * 3600) - Double(marMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if marMin < 10 && marSec > 10
            {
                marText = "\(String(marHour)):0\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if the sec is less than 10, add 0 for proper spacing
            else if marSec < 10 && marMin > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if min <10 and sec <10 add 0 for proper spacing
            else if marMin < 10 && marSec < 10
            {
                marText = "\(String(marHour)):0\(String(marMin)):0\(String(marSec))"
                appDelegate.marText = marText
    
            }
                
                // if min and sec are > 10, no additional 0
            else if marMin > 10 && marSec > 10
            {
                marText = "\(String(marHour)):\(String(marMin)):\(String(marSec))"
                appDelegate.marText = marText
    
            }
            
            
            // calcs for halfmarathon pace
            var halfmarTime = Double(totalTime) * 0.5 / Double(userDistInt)
            var halfmarHour = Int(halfmarTime / 3600)
            var halfmarMin = Int((halfmarTime - Double(halfmarHour * 3600)) / 60)
            var halfmarSec = Int(halfmarTime - Double(halfmarHour * 3600) - Double(halfmarMin * 60))
            
            // if the min is less than 10, add 0 for proper spacing
            if halfmarMin < 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if the sec is less than 10, add 0 for proper spacing
            else if halfmarSec < 10 && halfmarMin > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if min <10 and sec <10 add 0 for proper spacing
            else if halfmarMin < 10 && halfmarSec < 10
            {
                halfmarText = "\(String(halfmarHour)):0\(String(halfmarMin)):0\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
                
                // if min and sec are > 10, no additional 0
            else if halfmarMin > 10 && halfmarSec > 10
            {
                halfmarText = "\(String(halfmarHour)):\(String(halfmarMin)):\(String(halfmarSec))"
                appDelegate.halfmarText = halfmarText
    
            }
            
            
            // calcs for tenK pace
            var tenKTime = Double(totalTime) * 0.236995 / Double(userDistInt)
            var tenKMin = Int(tenKTime / 60)
            var tenKSec = Int(tenKTime - Double(tenKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if tenKSec < 10
            {
                tenKText = "\(String(tenKMin)):0\(String(tenKSec))"
                appDelegate.tenKText = tenKText
    
            }
            else if tenKSec >= 10
            {
                tenKText = "\(String(tenKMin)):\(String(tenKSec))"
                appDelegate.tenKText = tenKText
    
            }
            
            
            // calcs for fiveK pace
            var fiveKTime = Double(totalTime) * 0.118497 / Double(userDistInt)
            var fiveKMin = Int(fiveKTime / 60)
            var fiveKSec = Int(fiveKTime - Double(fiveKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if fiveKSec < 10
            {
                fiveKText = "\(String(fiveKMin)):0\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
    
            }
            else if fiveKSec >= 10
            {
                fiveKText = "\(String(fiveKMin)):\(String(fiveKSec))"
                appDelegate.fiveKText = fiveKText
    
            }
            
            
            // calcs for threeK pace
            var threeKTime = Double(totalTime) * 0.0710985 / Double(userDistInt)
            var threeKMin = Int(threeKTime / 60)
            var threeKSec = Int(threeKTime - Double(threeKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if threeKSec < 10
            {
                threeKText = "\(String(threeKMin)):0\(String(threeKSec))"
                appDelegate.threeKText = threeKText
    
            }
            else if threeKSec >= 10
            {
                threeKText = "\(String(threeKMin)):\(String(threeKSec))"
                appDelegate.threeKText = threeKText
    
            }
            
            
            // calcs for mile pace
            var mileTime = Double(totalTime) * 0.0381406 / Double(userDistInt)
            var mileMin = Int(mileTime / 60)
            var mileSec = Int(mileTime - Double(mileMin * 60))
            
            // if the sec is < 10, add proper spacing
            if mileSec < 10
            {
                mileText = "\(String(mileMin)):0\(String(mileSec))"
                appDelegate.mileText = mileText
    
            }
            else if mileSec >= 10
            {
                mileText = "\(String(mileMin)):\(String(mileSec))"
                appDelegate.mileText = mileText
    
            }
            
            
            // calcs for 1600m pace
            var sixteenhunTime = Double(totalTime) * 0.03791918 / Double(userDistInt)
            var sixteenhunMin = Int(sixteenhunTime / 60)
            var sixteenhunSec = Int(sixteenhunTime - Double(sixteenhunMin * 60))
            
            // if the sec is < 10, add proper spacing
            if sixteenhunSec < 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):0\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
    
            }
            else if sixteenhunSec >= 10
            {
                sixteenhunText = "\(String(sixteenhunMin)):\(String(sixteenhunSec))"
                appDelegate.sixteenhunText = sixteenhunText
    
            }
            
            
            // calcs for 1200m pace
            var twelvehunTime = Double(totalTime) * 0.02843939 / Double(userDistInt)
            var twelvehunMin = Int(twelvehunTime / 60)
            var twelvehunSec = Int(twelvehunTime - Double(twelvehunMin * 60))
            
            if twelvehunSec < 10
            {
                twelvehunText = "\(String(twelvehunMin)):0\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
    
            }
            else if twelvehunSec >= 10
            {
                twelvehunText = "\(String(twelvehunMin)):\(String(twelvehunSec))"
                appDelegate.twelvehunText = twelvehunText
    
            }
            
            
            // calcs for 1k pace
            var oneKTime = Double(totalTime) * 0.0236995 / Double(userDistInt)
            var oneKMin = Int(oneKTime / 60)
            var oneKSec = Int(oneKTime - Double(oneKMin * 60))
            
            // if the sec is < 10, add proper spacing
            if oneKSec < 10
            {
                oneKText = "\(String(oneKMin)):0\(String(oneKSec))"
                appDelegate.oneKText = oneKText
    
            }
            else if oneKSec >= 10
            {
                oneKText = "\(String(oneKMin)):\(String(oneKSec))"
                appDelegate.oneKText = oneKText
    
            }
            
            
            // calcs for 800m pace
            var eighthunTime = Double(totalTime) * 0.0189596 / Double(userDistInt)
            var eighthunMin = Int(eighthunTime / 60)
            var eighthunSec = Int(eighthunTime - Double(eighthunMin * 60))
            
            // if the sec is <10, add proper spacing
            if eighthunSec < 10
            {
                eighthunText = "\(String(eighthunMin)):0\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
    
            }
            else if eighthunSec >= 10
            {
                eighthunText = "\(String(eighthunMin)):\(String(eighthunSec))"
                appDelegate.eighthunText = eighthunText
    
            }
            
            
            // calcs for 400m pace
            var fourhunTime = Double(totalTime) * 0.0094798 / Double(userDistInt)
            var fourhunSec = Int(fourhunTime)
            var fourhunMSec = Int((fourhunTime - Double(fourhunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if fourhunMSec < 10
            {
                fourhunText = "\(String(fourhunSec)).0\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
    
            }
            else if fourhunMSec >= 10
            {
                fourhunText = "\(String(fourhunSec)).\(String(fourhunMSec))"
                appDelegate.fourhunText = fourhunText
    
            }
            
            
            // calcs for 200m pace
            var twohunTime = Double(totalTime) * 0.0047399 / Double(userDistInt)
            var twohunSec = Int(twohunTime)
            var twohunMSec = Int((twohunTime - Double(twohunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if twohunMSec < 10
            {
                twohunText = "\(String(twohunSec)).0\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
    
            }
            else if twohunMSec >= 10
            {
                twohunText = "\(String(twohunSec)).\(String(twohunMSec))"
                appDelegate.twohunText = twohunText
    
            }
            
            
            // calcs for 100m pace
            var onehunTime = Double(totalTime) * 0.00236995 / Double(userDistInt)
            var onehunSec = Int(onehunTime)
            var onehunMSec = Int((onehunTime - Double(onehunSec)) * 100)
            
            // if MSec <10, add proper spacing
            if onehunMSec < 10
            {
                onehunText = "\(String(onehunSec)).0\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
    
            }
            else if onehunMSec >= 10
            {
                onehunText = "\(String(onehunSec)).\(String(onehunMSec))"
                appDelegate.onehunText = onehunText
            }
        }
    }
}
    
    
    


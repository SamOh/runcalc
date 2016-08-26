//
//  PacesViewController.swift
//  RunCalc
//
//  Created by Samuel Oh on 12/5/15.
//  Copyright (c) 2015 Samuel Oh. All rights reserved.
//

import UIKit


class PacesViewController: UIViewController {

    // take in variables saved in the app delegate

    // more links to different display in storyboard
    @IBOutlet weak var DistDisplay: UILabel!
    @IBOutlet weak var TimeDisplay: UILabel!
    
    @IBOutlet weak var marathonPace: UILabel!
    @IBOutlet weak var halfMarathonPace: UILabel!
    @IBOutlet weak var tenKPace: UILabel!
    @IBOutlet weak var fiveKPace: UILabel!
    @IBOutlet weak var threeKPace: UILabel!
    @IBOutlet weak var milePace: UILabel!
    @IBOutlet weak var sixteenhunPace: UILabel!
    @IBOutlet weak var twelvehunPace: UILabel!
    @IBOutlet weak var oneKPace: UILabel!
    @IBOutlet weak var eighthunPace: UILabel!
    @IBOutlet weak var fourhunPace: UILabel!
    @IBOutlet weak var twohunPace: UILabel!
    @IBOutlet weak var onehunPace: UILabel!
    
    var defaults = NSUserDefaults()
        

    
    
    override func viewDidAppear(animated: Bool) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        DistDisplay.text = appDelegate.distanceDisplay
        TimeDisplay.text = appDelegate.timeDisplay
        marathonPace.text = appDelegate.marText
        halfMarathonPace.text = appDelegate.halfmarText
        tenKPace.text = appDelegate.tenKText
        fiveKPace.text = appDelegate.fiveKText
        threeKPace.text = appDelegate.threeKText
        milePace.text = appDelegate.mileText
        sixteenhunPace.text = appDelegate.sixteenhunText
        twelvehunPace.text = appDelegate.twelvehunText
        oneKPace.text = appDelegate.oneKText
        eighthunPace.text = appDelegate.eighthunText
        fourhunPace.text = appDelegate.fourhunText
        twohunPace.text = appDelegate.twohunText
        onehunPace.text = appDelegate.onehunText
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

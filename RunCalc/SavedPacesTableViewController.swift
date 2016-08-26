//
//  SavedPacesTableViewController.swift
//  RunCalc
//
//  Created by Samuel Oh on 1/7/16.
//  Copyright (c) 2016 Samuel Oh. All rights reserved.
//

import UIKit

class SavedPacesTableViewController: UITableViewController {
    
    // define struct that holds a distance and a time
    struct DistAndTime {
        var distanceDisplay : String
        var timeDisplay : String
    }
    
    // declare property on tableviewcontroller and intitialize it with empty array
    var savedPaces = [DistAndTime]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data
        loadSavedPaces()
    }
    
    func loadSavedPaces() {
        let pace1 = DistAndTime(distanceDisplay: "Mile", timeDisplay: "5:00")
        savedPaces += [pace1]
    }

    // Three Table view data source methods below: numOfSections, numOfRows, and cellForRow
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // Second data source method for number of rows
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedPaces.count
    }
    
    // third data source method
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "PacesTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PacesTableViewCell
        
        // Fetches the appropriate pace for the data source layout
        let pace = savedPaces[indexPath.row]
        
        cell.paceLabel.text = pace.timeDisplay
        cell.distanceLabel.text = pace.distanceDisplay
        
        return cell
    }
    
    
    
    
   // override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   //     performSegueWithIdentifier(<#identifier: String?#>, sender: savedPaces[indexPath.row])
   // }
    
   // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   //     let data = sender as! DistAndTime
        
   //     let vc = segue.destinationViewController as
   // }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}


//
//  ListViewController.swift
//  Scavenger Hunt
//
//  Created by Apple on 11/14/15.
//  Copyright © 2015 Joseph Goelz. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController{
    
    let myManager = ItemsManager()
    
    @IBAction func unWindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as! AddViewController //we know that it will be an AddView Controller
            if let newItem = addVC.newItem {
                
                myManager.itemsList += [newItem]
                myManager.save()
                
                let indexPath = NSIndexPath(forRow: myManager.itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    //autocomplete has all the protecoll methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myManager.itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        let item = myManager.itemsList[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
        
        //three i's of delegation this is the implementations
    }
}
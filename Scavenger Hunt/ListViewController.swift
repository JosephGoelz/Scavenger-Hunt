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
    
    var itemsList = ["Cat", "Bird", "Soylent"]
    
    //autocomplete has all the protecoll methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = itemsList[indexPath.row]
        
        return cell
        
        //three i's of delegation this is the implementations
    }
}
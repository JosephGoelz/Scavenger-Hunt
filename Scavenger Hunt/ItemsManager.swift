//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Apple on 11/14/15.
//  Copyright © 2015 Joseph Goelz. All rights reserved.
//

import UIKit

class ItemsManager {
    var itemsList = [ScavengerHuntItem]() //empty array of scavengerhunt items
    
    //now we need an archive path
    func archivePath() -> String? { //the arrow type is the specification of return type
        
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentDirectory = directoryList.first {
            //this is the place we are going to store documents
            return documentDirectory + "/ScavengerHuntItem"
        }
        assertionFailure("Could not determine where to save the file")
        return nil
        
    }
    
    //now we need somewhere to save our archive path
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(itemsList, toFile: theArchivePath){
                    print("Saved successfully!")
            } else {
                assertionFailure("Could not save to \(theArchivePath)")
            }
        }
    }
    
    //now we need to unarchive
    
    func unarchiveSavedItems() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
        
    }
    
    init(){
        unarchiveSavedItems()
    }
}
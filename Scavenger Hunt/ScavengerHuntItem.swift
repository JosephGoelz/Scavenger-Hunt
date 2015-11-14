//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by Apple on 11/14/15.
//  Copyright © 2015 Joseph Goelz. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    //the ,NSCoding means we want to conform to NSCoding
    let name: String
    var photo: UIImage?
    
    var isCompleted: Bool {
        get {
            return photo != nil
        }
    }
    
    //these help autocomplete
    let nameKey = "name"
    let photoKey = "photo"
    
    func encodeWithCoder(aCoder: NSCoder) { //we implemented encodeWithCoder
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
        
    }
    //we also need decode
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage
    }
    
    init(name:String) {
        self.name = name
    }
}
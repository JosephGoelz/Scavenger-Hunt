//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by Apple on 11/14/15.
//  Copyright © 2015 Joseph Goelz. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject {
    let name: String
    var photo: UIImage?
    
    var isCompleted: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name:String) {
        self.name = name
    }
}
//
//  Animal.swift
//  GregsonRaevan_CE4
//
//  Created by Raevan Gregson on 12/6/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import Foundation
import UIKit

class Animal{
    
    //class w/ two properties
    var name:String?
    var image:UIImage?
    
    init(name:String,image:UIImage){
        self.image = image
        self.name = name
    }
    
}

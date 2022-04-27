//
//  Person.swift
//  ContactApp3
//
//  Created by Oula mardawi on 24/04/2022.
//

import Foundation
import UIKit

class Person {
    var name: String?
    var status: String?
    var image: UIImage?
    var number: String?
    
    init () {
        self.name = "oula"
        self.status = "hi i am there"
        self.number = "0599877554"
        self.image = UIImage(named: "jeo") ?? UIImage()
    }
    
    init (name: String?, status: String?, number: String?, image: UIImage?) {
        self.name = name
        self.status = status
        self.number = number
        self.image = image
    }
    
    
}


//
//  Person.swift
//  ContactApp3
//
//  Created by Oula mardawi on 17/04/2022.
//

import Foundation
import UIKit

class Contact: NSObject {
    
    var name: String
    var status: String
    var image: UIImage
    var number: String
    
    override init () {
        self.name = "No Data"
        self.status = "No Data"
        self.number = "0000000000"
        self.image = UIImage(named: "imagePlaceholder") ?? UIImage()
    }
    
    init (name: String, status: String, number: String, image: UIImage) {
        self.name = name
        self.status = status
        self.number = number
        self.image = image
    }
    
}

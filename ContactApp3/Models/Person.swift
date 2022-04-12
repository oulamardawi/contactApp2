//
//  Person.swift
//  ContactApp3
//
//  Created by Oula mardawi on 14/03/2022.

import Foundation
import UIKit

class Person: NSObject, NSCoding {
    
    var name: String
    var title: String
    var Image: UIImage
    var number: String
    
    override init () {
        self.name = "oula"
        self.title = "hi i am there"
        self.number = "0599877554"
        self.Image = UIImage(named: "jeo") ?? UIImage()
    }
    
    init (name: String, title: String, number: String, Image: UIImage) {
        self.name = name
        self.title = title
        self.number = number
        self.Image = Image
    }
    
    // MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(title, forKey: "title")
        coder.encode(Image, forKey: "image")
        coder.encode(number, forKey: "number")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        title = coder.decodeObject(forKey: "title") as! String
        number = coder.decodeObject(forKey: "number") as! String
        Image = (coder.decodeObject(forKey: "Image") as! UIImage)
    }
}


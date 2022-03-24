//
//  Person.swift
//  ContactApp3
//
//  Created by Oula mardawi on 14/03/2022.

import Foundation
import UIKit

class Person {
        var name: String
        var title: String
        var Image: UIImage
        var number: String
    
    init (){
        self.name = "oula"
        self.title = "hi i am there"
        self.number = "0599877554"
        self.Image = UIImage(named:"jeo") ?? UIImage()
        }

    init (name: String, title: String, number: String, Image: UIImage) {
            self.name = name
            self.title = title
            self.number = number
            self.Image = Image
        }
    
    
    }


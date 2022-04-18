//
//  Person+CoreDataProperties.swift
//  
//
//  Created by Oula mardawi on 14/04/2022.
//
//

import Foundation
import CoreData
import UIKit

extension Person {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var status: String?
    @NSManaged public var image: UIImage?
    
}

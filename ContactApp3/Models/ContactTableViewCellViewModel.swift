//
//  File.swift
//  ContactApp3
//
//  Created by Oula mardawi on 05/04/2022.
//

import Foundation
import UIKit

class ContactTableViewCellViewModel {

    var contact: Person?
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
    var contactName: String? {
        return contact?.name
    }
    
    var contactImage: UIImage? {
        return contact?.Image
    }
    
    var contactStatus: String? {
        return contact?.title
    }
    
    init() {
    }

}

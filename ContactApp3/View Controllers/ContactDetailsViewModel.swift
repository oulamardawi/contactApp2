//
//  ContactDetailsViewModel.swift
//  ContactApp3
//
//  Created by Oula mardawi on 05/04/2022.
//

import Foundation
import UIKit

class ContactDetailsViewModel {
    var contact: Person?
    
    var contactName: String? {
        return contact?.name
    }
    
    var contactNumber: String? {
        return contact?.number
    }
    
    var contactImage: UIImage? {
        return contact?.Image
    }
 
    init(contact: Person) {
        self.contact = contact
    }
}

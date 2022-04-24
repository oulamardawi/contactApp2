//
//  ContactsListViewModel.swift
//  ContactApp3
//
//  Created by Oula mardawi on 05/04/2022.
//

import Foundation
import UIKit
import Contacts


protocol ContactListViewModelDelegate: AnyObject {
    func refresh()
}

class ContactsListViewModel {
    //MARK: vars
    var contacts = [Person]()
    weak var delegate: ContactListViewModelDelegate? //to bind ContactListViewModel to ContactListViewController
    
    //MARK: override methods
    init() {
        DispatchQueue.global(qos: .background).async {
            self.fetchAllContact()
            self.delegate?.refresh()  //unwrapping
        }
    }
    
    func fetchAllContact() {
        
        // Get access to the contacts store
        let store = CNContactStore()
        
        //Specify qhich data keys we want to fetch
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey] as [CNKeyDescriptor]
        
        //Create fetch request
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        //Call method to fetch all contacts
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
                let person = Person()
                person.name = contact.givenName
                person.number = contact.phoneNumbers.first?.value.stringValue
                if let contactImage = contact.imageData {
                    person.image = UIImage(data: contactImage, scale: 1.0)
                }
                self.contacts.append(person)
            })
        }
        catch {
            print("Error")
            
        }
    }
    
}


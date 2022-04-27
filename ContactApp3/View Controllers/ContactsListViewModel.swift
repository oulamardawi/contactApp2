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
    var groups: [CNGroup]?

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
        
        //Specify which data keys we want to fetch
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey] as [CNKeyDescriptor]
        
        //Create fetch request
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        //Call method to fetch all contacts
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
                let person = Person()
                person.name = contact.givenName + " " + contact.familyName
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
    
    func saveContact(contact: Person) {
        // Get access to the contacts store
        let store = CNContactStore()
        
        // Create a mutable object to store data in contactsStore(not thread-safe class), CNContacts is a(thread-safe class) but provide a get only property
        let contacts = CNMutableContact()
        if let contactName = contact.name {
              contacts.givenName = contactName
           }
        
        // Store the phone number in phoneNumbers dictionary with label(main phone)
        if let contactNumber = contact.number {
        contacts.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberMain, value: CNPhoneNumber(stringValue: contactNumber))]
            }
        
        // Store the profile picture as data
        if let contactImage = contact.image {
            contacts.imageData = contactImage.jpegData(compressionQuality: 1.0)
        }
        
        // Save
        let saveRequest = CNSaveRequest()
        saveRequest.add(contacts, toContainerWithIdentifier: nil)
        try? store.execute(saveRequest)
    }
    
    func deleteContact(contact: Person) {
        
        // Get access to the contacts store
        let store = CNContactStore()
        
        //Specify which data keys we want to fetch
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey] as [CNKeyDescriptor]
        
        //Create fetch request
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        //Call method to fetch all contacts
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { toDeleteContact, result in
                if contact.name == toDeleteContact.givenName + " " + toDeleteContact.familyName {
                    // Save
                    let saveRequest = CNSaveRequest()
                    saveRequest.delete(toDeleteContact.mutableCopy() as! CNMutableContact)
                    try? store.execute(saveRequest)
                }
            })
        }
        catch {
            print("Error")
            
        }
        
        
    
        
        
        
    }
    
}


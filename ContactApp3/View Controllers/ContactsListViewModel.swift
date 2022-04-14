//
//  ContactsListViewModel.swift
//  ContactApp3
//
//  Created by Oula mardawi on 05/04/2022.
//

import Foundation
import UIKit

class ContactsListViewModel {
    //MARK: vars
    var contacts = [Person]()
    
    //MARK: override methods
    init() {
        contacts = retrieveContactsArray() //to make data permenant in contacts otherwise
    }
    
    
    //MARK: custom methods
    func contactName(index: Int) -> String {
        return contacts[index].name
    }
    
    func contactStatus(index: Int) -> String {
        return contacts[index].title
    }
    
    func contactImage(index: Int) -> UIImage {
        return contacts[index].Image
    }
    
    func addContact(person: Person) {
        contacts.append(person)
        do { let contactsData = try NSKeyedArchiver.archivedData(withRootObject: contacts, requiringSecureCoding: false)
            UserDefaults.standard.set(contactsData, forKey: "contacts")
        }
        catch {
            print(error)
        }
    }
    
    func retrieveContactsArray() -> [Person] {
        guard let contactsArrayData = UserDefaults.standard.object(forKey: "contacts") as? NSData else {
            print("'contacts' not found in UserDefaults")
            return []
        }
        guard let contactsArray = NSKeyedUnarchiver.unarchiveObject(with: contactsArrayData as Data) as? [Person] else {
            print("Could not unarchive from placesData")
            return []
        }
        return contactsArray
    }
}


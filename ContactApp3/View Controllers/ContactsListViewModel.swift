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
    //variable of type NS ManagedObject layer to deal with persistantContainer
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: override methods
    init() {
        // contacts = retrieveContactsArray() //to make data permenant in contacts otherwise
        contacts = fetchContacts()
    }
    
    
    
//    
//    func addContact(person: Person) {
//        contacts.append(person)
//        do {
//            let contactsData = try NSKeyedArchiver.archivedData(withRootObject: contacts, requiringSecureCoding: false)
//            UserDefaults.standard.set(contactsData, forKey: "contacts")
//        }
//        catch {
//            print(error)
//        }
//    }
//    
//    func retrieveContactsArray() -> [Person] {
//        guard let contactsArrayData = UserDefaults.standard.object(forKey: "contacts") as? NSData else {
//            print("'contacts' not found in UserDefaults")
//            return []
//        }
//        guard let contactsArray = NSKeyedUnarchiver.unarchiveObject(with: contactsArrayData as Data) as? [Person] else {
//            print("Could not unarchive from placesData")
//            return []
//        }
//        return contactsArray
//    }
    
    
    func addNewContact(person: Person) {
        //save data from layer ns managed object to persistance container core data
        do {
            var newContact = Person(context: self.context)
            newContact.name = person.name
            newContact.number = person.number
            newContact.status = person.status
            newContact.image = person.image
            //get data from text fields as person object to newContact object of type NS managed object
            try self.context.save()
        }
        catch {
            print(error)
        }
        
    }
    
    func fetchContacts() -> [Person] {
        var contactsArray = [Person(context: self.context)]
        do {
            try contactsArray = context.fetch(Person.fetchRequest())
        }
        catch {
            print(error)
        }
        return contactsArray
    }
    
    
}

//darkmode
//new branch for core data with same mech

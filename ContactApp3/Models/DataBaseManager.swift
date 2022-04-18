//
//  DataBase Manager.swift
//  ContactApp3
//
//  Created by Oula mardawi on 17/04/2022.
//


import Foundation
import UIKit

class DataBaseManager {
    //MARK: vars
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: override methods
    init() {
    }
    
    static func addNewContact(contact: Contact) {
        //save data from layer ns managed object to persistance container core data
        do {
            let newContact = Person(context: context)
            newContact.name = contact.name
            newContact.number = contact.number
            newContact.status = contact.status
            newContact.image = contact.image
            
            //get data from text fields as person object to newContact object of type NS managed object
            try context.save()
        }
        catch {
            print(error)
        }
    }
    
    static func fetchContacts() -> [Person] {
        var contactsArray: [Person] = []
        do {
            try contactsArray = context.fetch(Person.fetchRequest())
        }
        catch {
            print(error)
        }
        return contactsArray
    }
    
    static func deleteContact(person: Person) {
        
        //remove the person
        context.delete(person)
        
        //Save the data
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        
    }
    
    
}


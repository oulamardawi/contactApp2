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
        contacts = DataBaseManager.fetchContacts()
    }
    
    func refresh() {
        contacts = DataBaseManager.fetchContacts()
    }
    
}


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
   // var contacts: [Person] = UserDefaults.standard.object(forKey: "myKey") as? [Person] ?? []
   // let contacts = ["horse", "cow", "camel", "sheep", "goat"]

   // UserDefaults.standard.set(contacts, forKey: "myKey")

    
    //MARK: override methods
    init() {
        configData()
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
    
    func configData() {
        //        contacts = [Person(name: "Joe Belfiore", title: "In a world far away", number: "0599434233", Image: UIImage(named: "joe") ?? UIImage()), Person(name: "Bill Gates", title: "What I'm doing here", number: "0599434566", Image: UIImage(named: "bill") ?? UIImage()), Person(name: "Mark Zuckerberg", title: "Really busy, WhatsApp only", number: "0599878699", Image: UIImage(named: "mark") ?? UIImage()), Person(name: "Masrissa Mayer", title: "In a rush to catch a plane", number: "0599834211", Image: UIImage(named: "marissa") ?? UIImage()), Person(name: "Sundar Pichai", title: "Do androids dream of electronic sheep?", number: "0568743329", Image: UIImage(named: "sudra") ?? UIImage()), Person(name: "Jeff Bezos", title: "Counting zeros, Prime time", number: "0569809923", Image: UIImage(named: "jeff") ?? UIImage())
        //                ]
    }
    
}

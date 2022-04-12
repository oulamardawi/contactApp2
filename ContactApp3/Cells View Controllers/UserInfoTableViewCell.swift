//
//  userProfileTableViewCell.swift
//  ContactApp3
//
//  Created by Oula mardawi on 17/03/2022.
//

import Foundation
import UIKit


class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var nameInfoLable: UILabel!
    @IBOutlet var numberInfoLable: UILabel!
    var contact: Person?
    
    func config(contact: Person?) {
        nameInfoLable.text = contact?.name
        numberInfoLable.text = contact?.number
    }
}




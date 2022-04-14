//
//  userProfileTableViewCell.swift
//  ContactApp3
//
//  Created by Oula mardawi on 17/03/2022.
//

import Foundation
import UIKit


class UserProfileTableViewCell: UITableViewCell {
    
    @IBOutlet var avatarProfileImage: UIImageView!
    @IBOutlet var nameProfileLable: UILabel!
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
    func config(contact: Person?) {
        nameProfileLable.text = contact?.name
        avatarProfileImage.image = contact?.image
        avatarProfileImage.maskCircle()
        avatarProfileImage.addImageBorder(color: imageBorderColor)
    }
}


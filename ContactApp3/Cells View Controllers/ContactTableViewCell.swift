//
//  customCell.swift
//  ContactApp3
//
//  Created by Oula mardawi on 09/03/2022.
//

import Foundation
import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet var contactView: UIView!
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var avatarImg: UIImageView!
    @IBOutlet var titleLable: UILabel!
    
   
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
    
    func config(contact: Person?) {
        nameLable.text = contact?.name
        avatarImg.image = contact?.Image
        titleLable.text = contact?.title
        
        avatarImg.maskCircle()
        avatarImg.addImageBorder(color: imageBorderColor)
        
    }
}

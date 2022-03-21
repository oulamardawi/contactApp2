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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


//
//  UserInfo2TableViewCell.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit


class UserInfo2TableViewCell: UITableViewCell {
    
    @IBOutlet var UserInfoTextField: UITextField!
    @IBOutlet var UserInfoLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

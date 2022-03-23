//
//  UserImageTableViewCell.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit


class UserImageTableViewCell: UITableViewCell {
    
    @IBOutlet var UserImageView: UIImageView!
    @IBOutlet var imageLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

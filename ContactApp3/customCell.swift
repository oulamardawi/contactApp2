//
//  customCell.swift
//  ContactApp3
//
//  Created by Oula mardawi on 09/03/2022.
//

import Foundation
import UIKit

class customCell: UITableViewCell {

    @IBOutlet var contactView: UIView!
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var avatarImg: UIImageView!
    @IBOutlet var titleLable: UILabel!
    
    var grey = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)

    override func awakeFromNib() {
        super.awakeFromNib()
       avatarImg.layer.cornerRadius = (avatarImg.frame.size.width) / 2.2
       avatarImg.clipsToBounds = true
       avatarImg.layer.borderWidth = 2.5
       avatarImg.layer.borderColor = grey.cgColor    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

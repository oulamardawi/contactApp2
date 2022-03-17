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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  ContactTableCellView.swift
//  contactApp2
//
//  Created by Oula mardawi on 09/03/2022.
//

import Foundation
import UIKit


class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var contactImage: UIImageView!
    //@IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //contactImage.layer.cornerRadius = contactImage.frame.size.width / 2
        //contactImage.clipsToBounds = true
      //  titleLabel.text = names[row]

    }
    
    
}

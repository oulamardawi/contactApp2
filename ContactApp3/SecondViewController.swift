//
//  SecondViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 10/03/2022.
//

import Foundation
import UIKit

class SecondViewcontroller: UIViewController {

    
    @IBOutlet var avatarImgSecond: UIImageView!
    @IBOutlet var nameLableSecond: UILabel!
     
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var numberLable: UILabel!
    
    
    var img = UIImage()
    var userName = ""
    var userNumber = ""

    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImgSecond.maskCircle()
        avatarImgSecond.addImageBorder(color: imageBorderColor)

        avatarImgSecond.image = img
        nameLableSecond.text = userName
        nameLable.text = userName
        numberLable.text = userNumber

    }


}

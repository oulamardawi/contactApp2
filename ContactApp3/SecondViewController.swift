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

    var grey = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //duplicated
        avatarImgSecond.contentMode = UIView.ContentMode.scaleAspectFill
        avatarImgSecond.layer.borderWidth = 2.5
        avatarImgSecond.layer.borderColor = grey.cgColor
        
        avatarImgSecond.image = img
        nameLableSecond.text = userName
        nameLable.text = userName
        numberLable.text = userNumber

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImgSecond.layer.cornerRadius = (avatarImgSecond.frame.size.width) / 2;
        avatarImgSecond.clipsToBounds = true
    }

}

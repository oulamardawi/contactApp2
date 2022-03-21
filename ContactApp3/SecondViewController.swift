//
//  SecondViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 10/03/2022.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    

    @IBOutlet var UserProfileInfoTableView: UITableView!
    let customUserProfileCell = "customUserProfileCell"
    let customUserInfoCell = "customUserInfoCell"
    
    var img = UIImage()
    var userName = ""
    var userNumber = ""
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        UserProfileInfoTableView.delegate = self
        UserProfileInfoTableView.dataSource = self
        UserProfileInfoTableView.separatorStyle = .none
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 200
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
        if let userProfileTableCell = UserProfileInfoTableView.dequeueReusableCell(withIdentifier: customUserProfileCell) as? UserProfileTableViewCell{
          
                userProfileTableCell.avatarProfileImage.maskCircle()
                userProfileTableCell.avatarProfileImage.addImageBorder(color: imageBorderColor)
                userProfileTableCell.avatarProfileImage.image = img
                userProfileTableCell.nameProfileLable.text = userName
                return userProfileTableCell
            }
        }
        
        else if indexPath.row == 1 {
        if let userInfoTableCell = UserProfileInfoTableView.dequeueReusableCell(withIdentifier: customUserInfoCell) as? UserInfoTableViewCell{
              userInfoTableCell.nameInfoLable.text = userName
              userInfoTableCell.numberInfoLable.text = userNumber
              return userInfoTableCell
              }
          }
        return UITableViewCell()
    }
    
}



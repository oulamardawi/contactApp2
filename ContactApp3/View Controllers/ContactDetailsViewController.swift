//
//  SecondViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 10/03/2022.
//

import Foundation
import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet var UserProfileInfoTableView: UITableView!
    
    let customUserProfileCell = "customUserProfileCell"
    let customUserInfoCell = "customUserInfoCell"
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
    var contact: Person?
    
    public enum CellType: Int, CaseIterable {
        case Profile = 0
        case Information = 1
        
        var title: String {
            switch self {
            case .Profile:
                return "Name"
            case .Information:
                return "Number"
                
            }
        }
    }
    
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

extension ContactDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.allCases.count
    }
    //height
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 200
     }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = CellType(rawValue: indexPath.row)
        
        switch rowType {
            
        case .Profile:
            if let userProfileTableCell = UserProfileInfoTableView.dequeueReusableCell(withIdentifier: customUserProfileCell) as? UserProfileTableViewCell {
                userProfileTableCell.avatarProfileImage.maskCircle()
                userProfileTableCell.avatarProfileImage.addImageBorder(color: imageBorderColor)
                userProfileTableCell.avatarProfileImage.image = contact?.Image
                userProfileTableCell.nameProfileLable.text = contact?.name
                
                return userProfileTableCell
            }
        case .Information:
            if let userInfoTableCell = UserProfileInfoTableView.dequeueReusableCell(withIdentifier: customUserInfoCell) as? UserInfoTableViewCell {
                userInfoTableCell.nameInfoLable.text = contact?.name
                userInfoTableCell.numberInfoLable.text = contact?.number
                return userInfoTableCell
            }
            
        default:
            break
        }
        
        return UITableViewCell()
    }
}



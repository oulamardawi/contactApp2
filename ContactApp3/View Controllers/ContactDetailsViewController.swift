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
    
    var viewModel: ContactDetailsViewModel!
    var customUserProfileCell = "customUserProfileCell"
    let customUserInfoCell = "customUserInfoCell"
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
        let contact = viewModel.contact
        
        switch rowType {
            
        case .Profile:
            if let userProfileTableCell = UserProfileInfoTableView.dequeueReusableCell(withIdentifier: customUserProfileCell) as? UserProfileTableViewCell {
                userProfileTableCell.config(contact: contact)
                return userProfileTableCell
            }
        case .Information:
            if let userInfoTableCell = UserProfileInfoTableView.dequeueReusableCell(withIdentifier: customUserInfoCell) as? UserInfoTableViewCell {
                userInfoTableCell.config(contact: contact)
                return userInfoTableCell
            }
            
        default:
            break
        }
        return UITableViewCell()
    }
}

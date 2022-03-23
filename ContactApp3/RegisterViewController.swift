//
//  RegisterViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var UserInfoImageTableView: UITableView!
    let customUserInfoCell = "customUserInfo2Cell"
    let customUserImageCell = "customUserImageCell"
    var imagePicker = UIImagePickerController()
    
    public enum LableType: Int {
        case Name = 0
        case Number = 1
        case Status = 2
        
        var title: String {
            switch self {
            case .Name:
                return "Name"
            case .Number:
                return "Number"
            case .Status:
                return "Status"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        configView()
        imagePicker.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //delete frame!!
        floatingButton.frame = CGRect(
            x: view.frame.size.width/2 - 60,
            y: view.frame.size.height/2 + 350,
            width: 100,
            height: 50)
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func didTapButton() {
        
    }
    
    func configView() {
        UserInfoImageTableView.delegate = self
        UserInfoImageTableView.dataSource = self
        UserInfoImageTableView.separatorStyle = .none
    }
}


extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let numberRaw = indexPath.row
            let infoLable = LableType(rawValue: numberRaw)?.title
            
        if numberRaw == 0 || numberRaw == 1 || numberRaw == 2 {
            if let userInfo2TableCell = UserInfoImageTableView.dequeueReusableCell(withIdentifier: customUserInfoCell) as? UserInfo2TableViewCell{
                userInfo2TableCell.UserInfoLable.text = infoLable
                return userInfo2TableCell
            }
          }
        
          else if numberRaw == 3 {
            if let userImageTableCell = UserInfoImageTableView.dequeueReusableCell(withIdentifier: customUserImageCell) as? UserImageTableViewCell{
             //   userImageTableCell.UserImageView.maskCircle()
                 return userImageTableCell
            }
        }
        return UITableViewCell()
    }

 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let indexPath = IndexPath(row: 3, section: 0)
            if let userImageTableCell = UserInfoImageTableView.cellForRow(at: indexPath) as? UserImageTableViewCell {
                userImageTableCell.UserImageView.image = selectedImage
            }
        }
        dismiss(animated: true, completion: nil)
    }
}


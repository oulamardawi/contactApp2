//
//  RegisterViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit

protocol AddContactDelegate: AnyObject {
    func handleButton(contact: Person)
}

class AddContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var delegate: AddContactDelegate? //to bind a and b viewcontroller
    
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var userInfoImageTableView: UITableView!
    
    let customUserInfoCell = "customUserInfo2Cell"
    let customUserImageCell = "customUserImageCell"
    var imagePicker = UIImagePickerController()
    
    public enum LabelType: Int, CaseIterable {
        case Name = 1
        case Number = 2
        case Status = 3
        case Image = 0
        
        var title: String {
            switch self {
            case .Name:
                return "Name"
            case .Number:
                return "Number"
            case .Status:
                return "Status"
            case .Image:
                return "Image"
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        imagePicker.delegate = self
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction private func didTapSaveButton() {
        let person = Person()
        let nameIndexPath = IndexPath(row: LabelType.Name.rawValue, section: 0)
        if let userInfoTableCell = userInfoImageTableView.cellForRow(at: nameIndexPath) as? UserInfo2TableViewCell, let personName = userInfoTableCell.UserInfoTextField.text {
            person.name = personName
        }
        let numberIndexPath = IndexPath(row: LabelType.Number.rawValue, section: 0)
        if let userInfoTableCell = userInfoImageTableView.cellForRow(at: numberIndexPath) as? UserInfo2TableViewCell, let y = userInfoTableCell.UserInfoTextField.text {
            person.number = y
        }
        let statusIndexPath = IndexPath(row: LabelType.Status.rawValue, section: 0)
        if let userInfoTableCell = userInfoImageTableView.cellForRow(at: statusIndexPath) as? UserInfo2TableViewCell, let z = userInfoTableCell.UserInfoTextField.text {
            person.title = z
        }
        
        let imageIndexPath = IndexPath(row: LabelType.Image.rawValue, section: 0)
        if let userImageTableCell = userInfoImageTableView.cellForRow(at: imageIndexPath) as? UserImageTableViewCell, let img = userImageTableCell.UserImageView.image {
            person.Image = img
        }
        delegate?.handleButton(contact: person)  //unwrapping
        self.navigationController?.popViewController(animated: true)
    }
    
    func configView() {
        userInfoImageTableView.delegate = self
        userInfoImageTableView.dataSource = self
        userInfoImageTableView.separatorStyle = .none
        floatingButton.backgroundColor = .systemBlue
        floatingButton.tintColor = .white
        floatingButton.setTitleColor(.white, for: .normal)
        floatingButton.layer.shadowRadius = 10
        floatingButton.layer.shadowOpacity = 0.4
        floatingButton.layer.cornerRadius = 10
    }
}


extension AddContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LabelType.allCases.count
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowType = LabelType(rawValue: indexPath.row)
        switch rowType {
            
        case .Name, .Number, .Status:
            if let userInfo2TableCell = userInfoImageTableView.dequeueReusableCell(withIdentifier: customUserInfoCell) as? UserInfo2TableViewCell {
                userInfo2TableCell.UserInfoLable.text = rowType?.title
                return userInfo2TableCell
            }
        case .Image:
            if let userImageTableCell = userInfoImageTableView.dequeueReusableCell(withIdentifier: customUserImageCell) as? UserImageTableViewCell {
                return userImageTableCell
            }
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let indexPath = IndexPath(row: LabelType.Image.rawValue, section: 0)
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage, let userImageTableCell = userInfoImageTableView.cellForRow(at: indexPath) as? UserImageTableViewCell {
            userImageTableCell.UserImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
}



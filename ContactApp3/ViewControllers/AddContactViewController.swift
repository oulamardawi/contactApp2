//
//  RegisterViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit

//MARK: step 1 Add Protocol here.
protocol AddContactDelegate {
    func handleButton(contact: Person)
}

class AddContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var delegate: AddContactDelegate? //to bind a and b viewcontroller
    
    @IBOutlet var floatingButton: UIButton!
    @IBOutlet var UserInfoImageTableView: UITableView!
    
    let customUserInfoCell = "customUserInfo2Cell"
    let customUserImageCell = "customUserImageCell"
    var imagePicker = UIImagePickerController()
    
    public enum LabelType: Int, CaseIterable {
        case Name = 3
        case Number = 1
        case Status = 2
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
     @IBAction func didTapButton() {
        let person = Person()
        let indexPath0 = IndexPath(row: LabelType.Name.rawValue, section: 0)
        if let userInfoTableCell = UserInfoImageTableView.cellForRow(at: indexPath0) as? UserInfo2TableViewCell, let personName = userInfoTableCell.UserInfoTextField.text {
            person.name = personName
        }
        let indexPath1 = IndexPath(row: LabelType.Number.rawValue, section: 0)
        if let userInfoTableCell = UserInfoImageTableView.cellForRow(at: indexPath1) as? UserInfo2TableViewCell, let y = userInfoTableCell.UserInfoTextField.text {
            person.number = y
        }
        let indexPath2 = IndexPath(row: LabelType.Status.rawValue, section: 0)
        if let userInfoTableCell = UserInfoImageTableView.cellForRow(at: indexPath2) as? UserInfo2TableViewCell, let z = userInfoTableCell.UserInfoTextField.text {
            person.title = z
        }
        
        let indexPath3 = IndexPath(row: LabelType.Image.rawValue, section: 0)
        if let userImageTableCell = UserInfoImageTableView.cellForRow(at: indexPath3) as? UserImageTableViewCell, let img = userImageTableCell.UserImageView.image {
            person.Image = img
        }
         delegate?.handleButton(contact: person)  //unwrapping
        self.navigationController?.popViewController(animated: true)
    }
    
    func configView() {
        UserInfoImageTableView.delegate = self
        UserInfoImageTableView.dataSource = self
        UserInfoImageTableView.separatorStyle = .none
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
            if let userInfo2TableCell = UserInfoImageTableView.dequeueReusableCell(withIdentifier: customUserInfoCell) as? UserInfo2TableViewCell{
                userInfo2TableCell.UserInfoLable.text = rowType?.title
                return userInfo2TableCell
            }
        case .Image:
            if let userImageTableCell = UserInfoImageTableView.dequeueReusableCell(withIdentifier: customUserImageCell) as? UserImageTableViewCell{
                //   userImageTableCell.UserImageView.maskCircle()
                return userImageTableCell
            }
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let indexPath = IndexPath(row: LabelType.Image.rawValue, section: 0)
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage, let userImageTableCell = UserInfoImageTableView.cellForRow(at: indexPath) as? UserImageTableViewCell {
            userImageTableCell.UserImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}
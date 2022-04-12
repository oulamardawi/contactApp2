//
//  RegisterViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit

protocol AddContactDelegate: AnyObject {
    func handleButton(person: Person)
}

class AddContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var delegate: AddContactDelegate? //to bind a and b viewcontroller
    
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var userInfoImageTableView: UITableView!
    
    let customUserInfoCell = "customUserInfoCell"
    let customUserImageCell = "customUserImageCell"
    var imagePicker = UIImagePickerController()
    //let contactDefaults = UserDefaults.standard
    
    
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
        if let userInfoTableCell = userInfoImageTableView.cellForRow(at: nameIndexPath) as? UserPersonalInfoTableViewCell, let personName = userInfoTableCell.userInfoTextField.text {
            //UserDefaults.standard.set(personName, forKey: "name")
            person.name = personName
        }
        let numberIndexPath = IndexPath(row: LabelType.Number.rawValue, section: 0)
        if let userInfoTableCell = userInfoImageTableView.cellForRow(at: numberIndexPath) as? UserPersonalInfoTableViewCell, let personNumber = userInfoTableCell.userInfoTextField.text {
           // UserDefaults.standard.set(personNumber, forKey: "number")
            //person.number = UserDefaults.standard.string(forKey: "number")!
            person.number = personNumber
        }
        let statusIndexPath = IndexPath(row: LabelType.Status.rawValue, section: 0)
        if let userInfoTableCell = userInfoImageTableView.cellForRow(at: statusIndexPath) as? UserPersonalInfoTableViewCell, let personTitle = userInfoTableCell.userInfoTextField.text {
           // UserDefaults.standard.set(personTitle, forKey: "title")
            //person.title = UserDefaults.standard.string(forKey: "title")!
            person.title = personTitle
        }
        
        let imageIndexPath = IndexPath(row: LabelType.Image.rawValue, section: 0)
        if let userImageTableCell = userInfoImageTableView.cellForRow(at: imageIndexPath) as? UserImageTableViewCell, let personImage = userImageTableCell.userImageView.image {
            //  UserDefaults.standard.set(personImage, forKey: "image")
            //  person.Image = UserDefaults.standard.object(forKey: "image") as! UIImage
            person.Image = personImage
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
        floatingButton.layer.shadowOpacity = 0.15
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
            if let userInfoTableCell = userInfoImageTableView.dequeueReusableCell(withIdentifier: customUserInfoCell) as? UserPersonalInfoTableViewCell {
                userInfoTableCell.userInfoLable.text = rowType?.title
                //                if rowType?.title == "Number"{
                //                    userInfoTableCell.textField(<#T##textField: UITextField##UITextField#>, shouldChangeCharactersIn: , replacementString: "oula")
                //                }
                return userInfoTableCell
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
            userImageTableCell.userImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

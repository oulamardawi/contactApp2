//
//  RegisterViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let Viewcontroller = "Viewcontroller"
    let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y:0, width:60, height: 60))
        button.backgroundColor = .systemBlue
        let image = UIImage(systemName:"plus",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 10
        return button
    }()
    
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
            x: view.frame.size.width/2 - 50,
            y: view.frame.size.height/2 + 330,
            width: 100,
            height: 50)
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func didTapButton() {
        var person = Person()
        let indexPath0 = IndexPath(row: 0, section: 0)
        if let userInfoTableCell = UserInfoImageTableView.cellForRow(at: indexPath0) as? UserInfo2TableViewCell {
            if let x = userInfoTableCell.UserInfoTextField.text
            {
                person.name = x
                
            }
        }
        let indexPath1 = IndexPath(row: 1, section: 0)
        if let userInfoTableCell = UserInfoImageTableView.cellForRow(at: indexPath1) as? UserInfo2TableViewCell {
            if let y = userInfoTableCell.UserInfoTextField.text
            {
                person.number = y
            }
        }
        let indexPath2 = IndexPath(row: 2, section: 0)
        if let userInfoTableCell = UserInfoImageTableView.cellForRow(at: indexPath2) as? UserInfo2TableViewCell {
            if let z = userInfoTableCell.UserInfoTextField.text
            {
                person.title = z
            }
        }
        
        let indexPath3 = IndexPath(row: 3, section: 0)
        if let userImageTableCell = UserInfoImageTableView.cellForRow(at: indexPath3) as? UserImageTableViewCell {
            if let img = userImageTableCell.UserImageView.image
            {
                person.Image = img
            }
        }
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: Viewcontroller) as? ViewController {
            vc.contacts.append(person)
            self.navigationController?.pushViewController(vc, animated: true)
        }
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


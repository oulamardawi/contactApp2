//
//  UserInfo2TableViewCell.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit


class UserPersonalInfoTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet var userInfoTextField: UITextField!
    @IBOutlet var userInfoLable: UILabel!
    var rowType: LabelType? {
        didSet {
            if rowType == .Number {
                userInfoTextField.delegate = self
            }
            else {
                userInfoTextField.delegate = nil
            }
        }
    }
    
    override func awakeFromNib() { //must to be when there is functionality in my cell
        super.awakeFromNib()
    }
    
    //implement textField which is a func in UITextFieldProtocol
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == userInfoTextField {
            let allowedCharacters = "1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        }
        return (userInfoTextField != nil)
    }
}

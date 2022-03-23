//
//  floatingbutton.swift
//  ContactApp3
//
//  Created by Oula mardawi on 22/03/2022.
//

import Foundation
import UIKit

let floatingButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 0, y:0, width:60, height: 60))
    button.backgroundColor = .systemRed
    let image = UIImage(systemName:"plus",
                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
    button.setImage(image, for: .normal)
    button.tintColor = .white
    button.setTitleColor(.white, for: .normal)
    button.layer.shadowRadius = 10
    button.layer.shadowOpacity = 0.4
    button.layer.cornerRadius = 30
    return button
}()

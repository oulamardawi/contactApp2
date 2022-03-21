//
//  ViewController+extension.swift
//  ContactApp3
//
//  Created by Oula mardawi on 17/03/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
  public func maskCircle() {
   // self.translatesAutoresizingMaskIntoConstraints = false
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
  }
    
    public func addImageBorder(color: UIColor) {
      self.layer.borderWidth = 2.5
      self.layer.borderColor = color.cgColor
    }
}

//
//  CellTypeEnum.swift
//  ContactApp3
//
//  Created by Oula mardawi on 05/04/2022.
//

import Foundation
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

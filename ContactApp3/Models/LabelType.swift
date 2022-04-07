//
//  LabelType.swift
//  ContactApp3
//
//  Created by Oula mardawi on 05/04/2022.
//

import Foundation

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

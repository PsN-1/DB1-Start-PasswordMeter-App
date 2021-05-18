//
//  RequirementLevel.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 13/05/21.
//
//

import SwiftUI

enum RequirementLevel: String {

    case SUFFICIENT = "checkmark.circle.fill"
    case EXCEPTIONAL = "star.fill"
    case FAILURE = "xmark.circle.fill"
    case WARNING = "exclamationmark.circle.fill"
    
    var imageColor: Color {
        switch self {
        case .SUFFICIENT: return Color(.green)
        case .EXCEPTIONAL: return Color(.blue)
        case .FAILURE: return Color(.red)
        case .WARNING: return Color(.yellow)
        }
    }
}

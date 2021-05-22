//
//  Result.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

struct Results: Equatable {
    var className: String
    var count: Int
    var bonus: Int
    var requirementLevel: RequirementLevel
}

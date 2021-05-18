//
//  PasswordComplexity.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class PasswordComplexity {
    var score: Int
    var complexity: String = ""
    
    init(_ score: Int){
        self.score = score
    }

    func calculatePasswordComplexity() -> String{
        switch score {
        case 0..<20:
            complexity = "Very Weak"
        case 20..<40:
            complexity = "Weak"
        case 40..<60:
            complexity = "Good"
        case 60..<80:
            complexity = "Strong"
        default:
            complexity = "Very Strong"
        }

        return complexity
    }
}


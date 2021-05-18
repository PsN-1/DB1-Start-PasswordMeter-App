//
//  AnalysisResult.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 13/05/21.
//

import Foundation

protocol AnalysisResult {
    var password: String { get }
    
    func getResult() -> Results
}



//
//  loopClosure.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 18/05/21.
//

import Foundation

class loopClosure {
    
    func loop(word: String, closure: (_ : Character) -> Void) {
        let letters: [Character] = Array(word)
        
        for index in 0..<letters.count {
            closure(letters[index])
        }
    }
}

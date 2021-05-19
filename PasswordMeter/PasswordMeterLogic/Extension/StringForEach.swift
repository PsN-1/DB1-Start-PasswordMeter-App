//
//  loopClosure.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 18/05/21.
//

import Foundation

extension String {
    func forEach(_ closure: () -> Void) {
        let letters: [Character] = Array(self)
        
        for _ in 0..<letters.count {
            closure()
        }
    }
}

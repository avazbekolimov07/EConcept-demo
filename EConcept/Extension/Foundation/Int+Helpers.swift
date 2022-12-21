//
//  Int+Helpers.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Foundation

extension Int {
    func convertToDecimal() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let decimal = formatter.string(for: self) else { return nil }
        return decimal
    }
}

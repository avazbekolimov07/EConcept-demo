//
//  String+Helpers.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import CoreGraphics
import Foundation

extension String {

    static let thinSpace = " "
    static let space = " "
    static let emSpace = " "
    static let newLine = "\n"
    static let dot = "."
    static let comma = ","
    static let emDash = "—"
    static let bullet = "•"
    static let underscore = "_"
    static let slash = "/"
    static let pngExtension = ".png"
    static let ampersand = "&"
    static let tripleDot = "..."

    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2

        return formatter
    }()

    static func formatDecimal(num: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = .space
        guard let price = formatter.string(from: NSNumber(value: num)) else { return .empty }
        return price
    }
    
    var capitalizeFirstLetter: String {
        let first = prefix(1).capitalized
        let other = dropFirst()
        return first + other
    }

    func replaceNewLinesWithSpaces() -> String {
        replacingOccurrences(of: Self.newLine, with: Self.space)
    }

    func removePhoneUnrelatedSymbols() -> String {
        replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }

    // MARK: - Validators

    func isValidCode() -> Bool {
        return count == 6
    }

    func isValidTextLength() -> Bool {
        return count > 1
    }

    func isValidTopicLength() -> Bool {
        return count > 3
    }
    
    func isValidAmount() -> Bool {
        return count < 12
    }

    func isValidEmail() -> Bool {
        let emailRegExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegExp)
        return emailTest.evaluate(with: self)
    }

    func isValidLengthPassword() -> Bool {
        return count > 5 && count < 25
    }

    func isValidLengthPhone() -> Bool {
        return count > 3
    }

    func isValidName() -> Bool {
        return isValidTextLength()
    }
    

}

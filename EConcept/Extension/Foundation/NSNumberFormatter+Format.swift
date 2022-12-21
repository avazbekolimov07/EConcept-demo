//
//  NSNumberFormatter+Format.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension NumberFormatter {

    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
//        formatter.locale = Date.calendar.locale
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = .dot
        formatter.groupingSeparator = .empty

        return formatter
    }()

    static func formatValue(_ value: CGFloat) -> String {
        let number = NSNumber(value: value.native)
        return Self.formatter.string(from: number) ?? .empty
    }

}

extension CGFloat {

    var stringValue: String {
        NumberFormatter.formatValue(self)
    }

}

extension Double {

    var stringValue: String {
        NumberFormatter.formatValue(CGFloat(self))
    }

    var cgFloatValue: CGFloat {
        CGFloat(self)
    }

}

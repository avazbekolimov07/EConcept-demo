//
//  UILabel+init.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, textAligment: NSTextAlignment? = .left) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
    }
}

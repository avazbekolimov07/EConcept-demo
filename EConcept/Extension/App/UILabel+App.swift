//
//  UILabel+App.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
    }
}

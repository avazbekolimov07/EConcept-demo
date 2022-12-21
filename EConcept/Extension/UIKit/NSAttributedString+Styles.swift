//
//  NSAttributedString+Styles.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension NSAttributedString {

    convenience init(
        string: String,
        style: LabelStyle,
        textAlignment: NSTextAlignment = .left,
        lineBreakMode: NSLineBreakMode = .byWordWrapping,
        ignoreLineHeight: Bool = false
    ) {
        let attributes: [NSAttributedString.Key: Any]
        attributes = NSAttributedString.attributes(
            for: style,
               textAlignment: textAlignment,
               lineBreakMode: lineBreakMode,
               ignoreLineHeight: ignoreLineHeight
        )
        self.init(string: string, attributes: attributes)
    }

    convenience init(
        string: String,
        font: UIFont,
        textColor: UIColor,
        textAlignment: NSTextAlignment = .left,
        lineBreakMode: NSLineBreakMode = .byWordWrapping,
        ignoreLineHeight: Bool = false
    ) {
        let attributes: [NSAttributedString.Key: Any]
        attributes = NSAttributedString.attributes(
            font: font,
            textColor: textColor,
            lineBreakMode: lineBreakMode,
            ignoreLineHeight: ignoreLineHeight
        )
        self.init(string: string, attributes: attributes)
    }

    class func attributes(
        font: UIFont,
        textColor: UIColor,
        textAlignment: NSTextAlignment = .left,
        lineBreakMode: NSLineBreakMode = .byWordWrapping,
        ignoreLineHeight: Bool = false
    ) -> [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = font
        attributes[.foregroundColor] = textColor
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAlignment
        attributes[.paragraphStyle] = paragraphStyle
        return attributes
    }

    class func attributes(
        for style: LabelStyle,
        textAlignment: NSTextAlignment = .left,
        lineBreakMode: NSLineBreakMode = .byWordWrapping,
        ignoreLineHeight: Bool = false
    ) -> [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = style.font
        attributes[.foregroundColor] = style.color
        attributes[.kern] = style.letterSpacing

        let paragraphStyle = NSMutableParagraphStyle()
        if !ignoreLineHeight, let lineHeight = style.lineHeight {
            paragraphStyle.maximumLineHeight = lineHeight
            paragraphStyle.minimumLineHeight = lineHeight
        }
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAlignment

        attributes[.paragraphStyle] = paragraphStyle
        return attributes
    }

}

struct LabelStyle {
    var font: UIFont
    var color: UIColor
    var lineHeight: CGFloat?
    var letterSpacing: CGFloat?
}

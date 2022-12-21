//
//  UITapGestureRecognizer+Link.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UITapGestureRecognizer {

    func isTapOnLink(at label: UILabel, range: NSRange) -> Bool {

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText ?? .init())

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = .zero
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines

        label.sizeToFit()
        let labelSize = label.frame.size
        textContainer.size = labelSize

        let locationOfTouchInLabel = location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )

        guard locationOfTouchInTextContainer.x < labelSize.width else { return false }

        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        guard indexOfCharacter < textStorage.length - 1 else { return false }

        return NSLocationInRange(indexOfCharacter, range)
    }

}

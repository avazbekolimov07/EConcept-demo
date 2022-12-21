//
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//
import UIKit

// MARK: - Jost

extension UIFont {

    static func markPro(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Mark Pro", of: size)
    }
}


// MARK: - Private methods

extension UIFont {

    private static func unwrappedFont(from fontName: String?, of size: CGFloat) -> UIFont {
        guard let fontName = fontName else { return .systemFont(ofSize: size) }
        return UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size)
    }

}

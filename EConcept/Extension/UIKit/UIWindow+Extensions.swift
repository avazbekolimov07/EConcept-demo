//
//  UIWindow+Extensions.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UIWindow {

    static var keyWindow: UIWindow? {
        UIApplication.shared.windows.first(where: \.isKeyWindow)
    }

    static var safeAreaInsets: UIEdgeInsets {
        keyWindow?.safeAreaInsets ?? .zero
    }

}

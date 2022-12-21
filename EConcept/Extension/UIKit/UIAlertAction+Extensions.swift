//
//  UIAlertAction+Extensions.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UIAlertAction {

    /// Can stop to work in any moment
    var textColor: UIColor {
        get { value(forKey: "titleTextColor") as? UIColor ?? UIColor() }
        set { setValue(newValue, forKey: "titleTextColor") }
    }

    static var cancelAction: UIAlertAction = {
        let action = UIAlertAction(title: "Cancel", style: .cancel)
        action.textColor = .red
        return action
    }()

}

//
//  UIView+Indicator.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

enum IndicatorStyle {
	case grayLarge
	case whiteLarge
	case gray
    case white

	var color: UIColor {
		switch self {
		case .grayLarge, .gray:
			return .gray
        case .whiteLarge, .white:
			return .white
		}
	}

	var style: UIActivityIndicatorView.Style {
		switch self {
		case .grayLarge, .whiteLarge:
			return .large
        case .gray, .white:
			return .medium
		}
	}
}

extension UIView {

	func addLoadingIndicator(indicatorStyle: IndicatorStyle) {
		let view = UIActivityIndicatorView(style: indicatorStyle.style)
		view.color = indicatorStyle.color
		view.startAnimating()
		addSubviews(view)

        view.center(inView: self)
	}

	func removeLoadingIndicator() {
		let views = subviews.compactMap { $0 as? UIActivityIndicatorView }

		views.forEach {
			$0.removeFromSuperview()
		}
	}

}

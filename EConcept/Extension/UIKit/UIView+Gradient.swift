//
//  UIView+Gradient.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UIView {

    func applyGradient(colors: [UIColor], locations: [NSNumber]? = nil, startPoint: CGPoint? = nil, endPoint: CGPoint? = nil) {
        let sublayers = layer.sublayers
        guard let gradientLayer = sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer else {
            let gradientLayer = CAGradientLayer()
            layer.insertSublayer(gradientLayer, at: 0)
            applyGradient(colors: colors, locations: locations, startPoint: startPoint, endPoint: endPoint)
            return
        }

        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.maskedCorners = layer.maskedCorners
        gradientLayer.colors = colors.map { $0.cgColor }

        guard let startPoint = startPoint, let endPoint = endPoint else {
            gradientLayer.locations = locations
            return
        }

        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }

    func removeGradientIfExists() {
        guard let gradientLayer = layer.sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer else { return }
        gradientLayer.removeFromSuperlayer()
    }

}

extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
}

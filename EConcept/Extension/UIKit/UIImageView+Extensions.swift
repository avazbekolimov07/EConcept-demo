//
//  UIImageView+Extensions.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Nuke
import UIKit

extension UIImageView {

    func setImage(stringURL: String?, loadingIndicator: IndicatorStyle? = nil, completion: ((UIImage?) -> Void)? = nil) {
        guard let stringURL = stringURL, let url = URL(string: stringURL) else { return }
        setImage(url: url, loadingIndicator: loadingIndicator, completion: completion)
    }

    func setImage(url: URL?, loadingIndicator: IndicatorStyle? = nil, completion: ((UIImage?) -> Void)? = nil) {
		guard let url = url else { return }

        if let indicator = loadingIndicator {
            addLoadingIndicator(indicatorStyle: indicator)
        }

		Nuke.loadImage(with: url, into: self) { [weak self] result in
			self?.removeLoadingIndicator()

			switch result {
			case let .success(response):
				completion?(response.image)
			case .failure:
				break
			}
		}
    }

}

extension UIImage {
    func tint(with color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()

        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

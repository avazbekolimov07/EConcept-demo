//
//  NavigationController.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = .white
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = .clear
        navigationBar.isTranslucent = true
        interactivePopGestureRecognizer?.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .default
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let vc = viewControllers.last {
            if let currentVC = vc as? BaseViewController {

                self.navigationController?.popViewController(animated: false)
            }
            
        }
        return false
    }
    
    
}


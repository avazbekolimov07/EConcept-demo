//
//  BaseViewController.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class BaseViewController: UIViewController, KeyboardStateDelegate {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        return view
    }()
    
    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        registerForKeyboardNotifications(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        unregisterFromKeyboardNotifications()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    // MARK: - KeyboardStateDelegate

    func keyboardWillTransition(_: KeyboardState) {}

    func keyboardTransitionAnimation(_ state: KeyboardState) {}

    func keyboardDidTransition(_: KeyboardState) {}
    
    func wrapIntoNavigationController() -> NavigationController {
        let navController = NavigationController()
        navController.setViewControllers([self], animated: false)
        return navController
    }
}

// MARK: - LoaderIndicator

extension BaseViewController {
    
    func addLoadingIndicator(indicatorStyle: IndicatorStyle) {
        let loader = UIActivityIndicatorView(style: indicatorStyle.style)
        loader.color = indicatorStyle.color
        loader.startAnimating()
        view.addSubviews(backgroundView, loader)
        backgroundView.fillSuperview()
        loader.center(inView: backgroundView)
    }
    
    func removeLoadingIndicator() {
        let loaders = view.subviews.compactMap { $0 as? UIActivityIndicatorView }
        
        backgroundView.removeFromSuperview()
        
        loaders.forEach {
            $0.stopAnimating()
            $0.removeFromSuperview()
        }
    }
}

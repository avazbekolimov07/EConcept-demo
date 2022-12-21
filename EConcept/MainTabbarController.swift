//
//  MainTabbarController.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class MainTabbarController: UITabBarController, UITabBarControllerDelegate  {
    var mainVC: MainViewController!
    var backetVC: ViewController!
    var heartVC: HeartViewController!
    var profileVC: ProfileViewController!
    
    private var shapeLayer: CAShapeLayer?
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initControllers()
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.backgroundColor = .clear
        UITabBar.appearance().tintColor = .orangeColor
        UITabBar.appearance().layer.cornerRadius = 30
        addTabBarShadowBG()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.clipsToBounds = false
        
        
    }
    
    private func addTabBarShadowBG() {
        let tabBarCornerRadius: CGFloat = 30
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(
            roundedRect: tabBar.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: tabBarCornerRadius, height: 1.0)).cgPath
        shapeLayer.fillColor = UIColor.darkBlueColor.cgColor
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: tabBar.bounds, cornerRadius: tabBarCornerRadius).cgPath
        shapeLayer.shadowOpacity = 0.5
        shapeLayer.shadowRadius = 4
        shapeLayer.borderWidth = 1
        shapeLayer.shadowOffset = CGSize(width: 0, height: -1)
        shapeLayer.shouldRasterize = true
        shapeLayer.rasterizationScale = UIScreen.main.scale

        if let oldShapeLayer = self.shapeLayer {
            tabBar.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            tabBar.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    
    func initControllers() {
        mainVC = MainViewController()
        backetVC = ViewController()
        heartVC = HeartViewController()
        profileVC = ProfileViewController()
        
        let customTabBarItem: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "expo"), selectedImage: UIImage(named: "expo")?.tint(with: UIColor.orangeColor))
        let customTabBarItem1: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "bucketBig"), selectedImage: UIImage(named: "bucketBig")?.tint(with: UIColor.orangeColor))
        let customTabBarItem2: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "heartWhite"), selectedImage: UIImage(named: "heartWhite")?.tint(with: UIColor.orangeColor))
        let customTabBarItem3: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "person"), selectedImage: UIImage(named: "person")?.tint(with: UIColor.orangeColor))
        mainVC.tabBarItem = customTabBarItem
        backetVC.tabBarItem = customTabBarItem1
        heartVC.tabBarItem = customTabBarItem2
        profileVC.tabBarItem = customTabBarItem3
        
        setViewControllers([mainVC.wrapIntoNavigationController(),
                            backetVC.wrapIntoNavigationController(),
                            heartVC.wrapIntoNavigationController(),
                            profileVC.wrapIntoNavigationController(),
                           ], animated: false)
        
        tabBar.tintColor = .orangeColor
        tabBar.unselectedItemTintColor = .white
        
    }
}







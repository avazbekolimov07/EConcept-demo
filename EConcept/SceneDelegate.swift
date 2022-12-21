//
//  SceneDelegate.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if #available(iOS 13.0, *) {
            self.window?.overrideUserInterfaceStyle = .light
        }
        
        window = UIWindow(windowScene: scene as! UIWindowScene)
        window?.makeKeyAndVisible()
        
        let viewController = MainTabbarController()
        self.window?.rootViewController = viewController
    }

    


}


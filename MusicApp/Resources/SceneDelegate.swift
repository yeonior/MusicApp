//
//  SceneDelegate.swift
//  MusicApp
//
//  Created by Ruslan on 07.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        if AuthManager.shared.isSignedIn {
            window?.rootViewController = TabBarViewController()
        } else {
            let navigationController = UINavigationController(rootViewController: WelcomeViewController())
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.navigationItem.largeTitleDisplayMode = .always
            window?.rootViewController = navigationController
        }
        
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}


//
//  SceneDelegate.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController()
        let viewController = MainPageViewController()
        navController.viewControllers = [viewController]
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
        }
}


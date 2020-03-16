//
//  SceneDelegate.swift
//  coronaCases
//
//  Created by Andrew Lawler on 15/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }
    
    func createRecentNewsNC() -> UINavigationController {
        let destVC = RecentNewsVC()
        destVC.title = "Recent News"
        let flag = UIImage(systemName: "flag")
        destVC.tabBarItem = UITabBarItem(title: "Recent News", image: flag!, tag: 2)
        return UINavigationController(rootViewController: destVC)
    }
    
    func createGlobalStatsNC() -> UINavigationController {
        let destVC = GlobalStatsVC()
        destVC.title = "Global Stats"
        let globe = UIImage(systemName: "globe")
        destVC.tabBarItem = UITabBarItem(title: "Global Stats", image: globe!, tag: 0)
        return UINavigationController(rootViewController: destVC)
    }
    
    func createSearchNC() -> UINavigationController {
        let destVC = SearchVC()
        destVC.title = "Search"
        let search = UIImage(systemName: "magnifyingglass")
        destVC.tabBarItem = UITabBarItem(title: "Search", image: search!, tag: 1)
        return UINavigationController(rootViewController: destVC)
    }
    
    func createAdviceNC() -> UINavigationController {
        let destVC = AdviceVC()
        destVC.title = "What to do"
        let pencil = UIImage(systemName: "ear")
        destVC.tabBarItem = UITabBarItem(title: "What to do", image: pencil!, tag: 3)
        return UINavigationController(rootViewController: destVC)
    }
    
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemPink
        tabbar.viewControllers = [createGlobalStatsNC(), createSearchNC(), createRecentNewsNC(), createAdviceNC()]
        return tabbar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


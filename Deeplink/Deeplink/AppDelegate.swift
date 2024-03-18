//
//  AppDelegate.swift
//  Deeplink
//
//  Created by Nikola Ilic on 18.3.24..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            // Kreiranje prozora
            window = UIWindow(frame: UIScreen.main.bounds)
            
            // Inicijalizacija glavne scene
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let joblistVC = storyboard.instantiateViewController(withIdentifier: "JobListViewController") as? JobListViewController else {
                return false
            }
            let navigationVC = UINavigationController(rootViewController: joblistVC)
            window?.rootViewController = navigationVC
            
            // Prikazivanje prozora
            window?.makeKeyAndVisible()
            
            return true
        }
    }



//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    var window: UIWindow?
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
//        window?.makeKeyAndVisible()
//    }
//}


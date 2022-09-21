//
//  SceneDelegate.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 12/09/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowsScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowsScene)
        window.makeKeyAndVisible()
        self.window = window
        let controller = HomeViewController()
        
        self.addAsRoot(controller)
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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
    
    
    private func addAsRoot(_ controller: UIViewController) {
        let navigation = UINavigationController(rootViewController: controller)
        navigation.navigationBar.tintColor = UIColor.textDark
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.primaryColor
        
        let appearance = UINavigationBar.appearance()
        appearance.standardAppearance = navBarAppearance
        appearance.compactAppearance = navBarAppearance
        appearance.scrollEdgeAppearance = navBarAppearance
        if #available(iOS 15.0, *) {
            appearance.compactScrollEdgeAppearance = navBarAppearance
        } else {
            // Fallback on earlier versions
        }
        window?.rootViewController = navigation
    }
    
}

// TODO: move to a better location
extension UIColor {
    
    static let primaryColor: UIColor = UIColor(red: 255, green: 230, blue: 0) //rgb(255, 230, 0)
    static let backgroundColor: UIColor = .systemGray
    static let textDark: UIColor = UIColor(red: 51, green: 51, blue: 51)
    static let primaryBackground: UIColor = UIColor(red: 237, green: 237, blue: 237)
    static let secondaryBackground: UIColor = UIColor(red: 245, green: 245, blue: 245)
    static let whiteBackground: UIColor = UIColor(red: 255, green: 255, blue: 255)
    
    
    convenience init(red: Int, green: Int, blue: Int) {
            let newRed = CGFloat(red)/255
            let newGreen = CGFloat(green)/255
            let newBlue = CGFloat(blue)/255
            
            self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        }
}


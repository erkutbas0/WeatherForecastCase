//
//  AppDelegate.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        startAppCoordinator()
        
        return true
    }
    
    func startAppCoordinator() {
        guard let appCoordinator = returnResolver().resolve(AppCoordinator.self) else { return }
        appCoordinator.start()
    }

}

// Mark: AssemblerResolverDelegate
extension AppDelegate: AssemblerResolverDelegate {
    
}

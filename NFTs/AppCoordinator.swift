//
//  AppCoordinator.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    
    // MARK: - Coordinator Properties
    var navigation: UINavigationController
    var children: [Coordinator] = []
    
    // MARK: - AppCoordinator Properties
    var window: UIWindow?
    
    let tabBarController: UITabBarController
    
    public init(window: UIWindow?) {
        self.window =  window
        navigation = UINavigationController()
        tabBarController = UITabBarController()
        window?.rootViewController = tabBarController
            
        children = [
            ExampleCoordinator(),
            ExampleCoordinator()
        ]
    }
    
    func start() {
        tabBarController.viewControllers = children.map { $0.navigation }
        window?.makeKeyAndVisible()
    }
}

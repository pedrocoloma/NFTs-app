//
//  ExampleCoordinator.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import UIKit

class ExampleCoordinator: Coordinator {
    
    // MARK: - Coordinator Properties
    var navigation: UINavigationController
    
    init() {
        navigation = UINavigationController(rootViewController: FeaturedViewController())
    }
    
    func start() {
        
    }
}

//
//  FeaturedCoordinator.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import UIKit

class FeaturedCoordinator: Coordinator {
    
    // MARK: - Coordinator Properties
    var navigation: UINavigationController
    
    // MARK: - Properties
    var featuredViewModel: FeaturedViewModel
    var featuredViewController: FeaturedViewController?
    
    init() {
        featuredViewModel = FeaturedViewModel()
        navigation = UINavigationController(rootViewController: FeaturedViewController(viewModel: featuredViewModel))
    }
    
    func start() {
        
    }
}

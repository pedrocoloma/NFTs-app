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
    var featuredViewController: FeaturedViewController
    
    // MARK: - initializer
    init() {
        featuredViewModel = FeaturedViewModel()
        featuredViewController = FeaturedViewController(viewModel: featuredViewModel)
        featuredViewModel.viewDelegate = featuredViewController
        
        navigation = UINavigationController(rootViewController: featuredViewController)
        featuredViewModel.delegate = self
    }
    
    func start() {
        
    }
}

extension FeaturedCoordinator: FeaturedViewModelDelegate {
    func didSelect(at position: Int) {
        let detailsViewController = FeaturedDetailsViewController()
        navigation.pushViewController(detailsViewController, animated: true)
    }
}

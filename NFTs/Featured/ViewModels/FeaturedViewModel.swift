//
//  FeaturedViewModel.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation

protocol FeaturedViewModelDelegate: AnyObject {
    func didFetchFeaturedData(_ data: FeaturedNFTs)
}

class FeaturedViewModel {
    weak var delegate: FeaturedViewModelDelegate?
    
    var service: FeaturedServiceProtocol
    
    init() {
        service = FeaturedService()
    }
    
    func fetchData() {
        service.fetchFeatured(api: .list) { nfts in
            print(nfts)
        }
    }
    
}

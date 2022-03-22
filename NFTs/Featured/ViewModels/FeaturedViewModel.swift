//
//  FeaturedViewModel.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation

protocol FeaturedViewModelDelegate {
    func didFetchFeaturedData(_ data: FeaturedNFTs)
}

class FeaturedViewModel {
    weak var delegate: FeaturedViewModelDelegate?
    
    private let service: NFTsServiceProtocol
    
    init(service: NFTsServiceProtocol) {
        self.service = service
    }
    
}

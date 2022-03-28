//
//  FeaturedViewModel.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation

protocol FeaturedViewModelDelegate: AnyObject {
    func didSelect(nft: NFT)
}

protocol FeaturedViewDelegate: AnyObject {
    func isLoadingData()
    func dataLoadedWithSuccess()
    func dataLoadedWithErrror(error: AppError)
}

class FeaturedViewModel {
    weak var delegate: FeaturedViewModelDelegate?
    weak var viewDelegate: FeaturedViewDelegate?
    
    var service: FeaturedServiceProtocol
    
    var nfts: [NFT] = []
    
    init() {
        service = FeaturedService()
    }
    
    // MARK: - Methods
    func fetchData() {
        viewDelegate?.isLoadingData()
        service.fetchFeatured(api: .list) { result in
            switch result {
            case .success(let featuredNFTs):
                self.nfts = featuredNFTs.items
                self.viewDelegate?.dataLoadedWithSuccess()
            case .failure(let error):
                self.viewDelegate?.dataLoadedWithErrror(error: error)
            }
        }
    }
    
    func didSelect(nft: NFT) {
        delegate?.didSelect(nft: nft)
    }
}

//
//  FeaturedService.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation


protocol FeaturedServiceProtocol {
    func fetchFeatured(api: FeaturedAPI, _ completion: @escaping ((FeaturedNFTs?) -> Void))
}

class FeaturedService: Service<FeaturedAPI>, FeaturedServiceProtocol {
    
    func fetchFeatured(api: FeaturedAPI, _ completion: @escaping ((FeaturedNFTs?) -> Void)) {
        fetch(api: .list) { result in
            
            switch result {
            case .success(let data):
                // TODO: remove this forcce unwrap
                
                let featuredNFTs: FeaturedNFTs = try! JSONDecoder().decode(FeaturedNFTs.self, from: data)
                completion(featuredNFTs)
            case .failure(let error):
                completion(nil)
            }
        }
    }

}

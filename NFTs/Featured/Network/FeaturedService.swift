//
//  FeaturedService.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation


protocol FeaturedServiceProtocol {
    func fetchFeatured(api: FeaturedAPI, _ completion: @escaping ((Result<FeaturedNFTs, AppError>) -> Void))
}

class FeaturedService: Service<FeaturedAPI>, FeaturedServiceProtocol {
    
    func fetchFeatured(api: FeaturedAPI, _ completion: @escaping ((Result<FeaturedNFTs, AppError>) -> Void)) {
        fetch(api: .list) { result in
            
            switch result {
            case .success(let data):
                let featuredNFTs: FeaturedNFTs?
                do {
                    featuredNFTs = try JSONDecoder().decode(FeaturedNFTs.self, from: data)
                    if let nfts = featuredNFTs {
                        completion(.success(nfts))
                    } else {
                        completion(.failure(.emptyResponse))
                    }
                } catch (_) {
                    completion(.failure(.parse))
                }
            case .failure(_):
                completion(.failure(.network))
            }
        }
    }
}

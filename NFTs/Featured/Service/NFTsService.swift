//
//  NFTsService.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation


protocol NFTsServiceProtocol {
    func fetchFeaturedList(_ completion: @escaping ((FeaturedNFTs?) -> Void))
}

class NFTsService: NFTsServiceProtocol {
    func fetchFeaturedList(_ completion: @escaping ((FeaturedNFTs?) -> Void)) {
        
    }
  
}

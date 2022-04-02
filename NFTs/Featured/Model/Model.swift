//
//  Model.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation

struct NFT: Decodable {
    var name: String?
    var collection: String?
    var id: String
    var description: String?
    var image_url: String?
    var listing: String?
    var top_bid_weth: String?
    var top_bid_dollars: String?
    var collection_image_url: String?
}

struct FeaturedNFTs: Decodable {
    var items: [NFT]
}

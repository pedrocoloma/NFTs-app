//
//  FeaturedServiceMock.swift
//  NFTsTests
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import Foundation
@testable import NFTs

enum APIError: Error {
    case noData
    case parseError
}

class FeaturedServiceMock: FeaturedServiceProtocol {
    var errorAPI: APIError? = nil
    
    func fetchFeatured(api: FeaturedAPI, _ completion: @escaping ((FeaturedNFTs?) -> Void)) {
        switch errorAPI {
        case .parseError:
            completion(nil)
        case .noData:
            completion(nil)
        default:
            if let result = parseJSONMock() {
                completion(result)
            } else {
                completion(nil)
            }
        }
    }
    
    private func parseJSONMock() -> FeaturedNFTs? {
        guard let path = Bundle.main.path(forResource: "featured_nfts", ofType: "json") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let result = try JSONDecoder().decode(FeaturedNFTs.self, from: data)
            return result
        } catch {
            return nil
        }
    }
}

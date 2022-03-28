//
//  FeaturedAPI.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 26/03/22.
//

import Foundation

enum FeaturedAPI: API {
    case list
    
    var path: String {
        switch self {
        case .list:
            return "/featured"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
}

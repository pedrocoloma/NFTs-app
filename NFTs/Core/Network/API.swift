//
//  API.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 27/03/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol API {
    var method: HTTPMethod { get }
    var path: String { get }
}

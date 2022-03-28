//
//  AppError.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 27/03/22.
//

import Foundation

enum AppError: Error {
    case parse
    case network
    case emptyResponse
    case unknown
}

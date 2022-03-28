//
//  FeaturedViewModelDelegateMock.swift
//  NFTsTests
//
//  Created by Pedro Felipe Coloma de Araujo on 22/03/22.
//

import XCTest
@testable import NFTs

class FeaturedViewModelDelegateMock: FeaturedViewModelDelegate {
    
    var displayedFeaturedData = false
    var displayedError = false
    
    func didFetchFeaturedData(_ data: FeaturedNFTs) {
        displayedFeaturedData = true
    }
}


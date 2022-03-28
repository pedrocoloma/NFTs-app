//
//  FeaturedViewModelTests.swift
//  NFTsTests
//
//  Created by Pedro Felipe Coloma de Araujo on 20/03/22.
//

import XCTest
@testable import NFTs

class FeaturedViewModelTests: XCTestCase {
    
    var viewModel: FeaturedViewModel!
    let delegate = FeaturedViewModelDelegateMock()
    let service = FeaturedServiceMock()
    
    override func setUp() {
        viewModel = FeaturedViewModel()
        viewModel.service = service
        viewModel.delegate = delegate
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testFetchFeaturedDataWithSuccess() {
        viewModel.fetchData()
        XCTAssertTrue(delegate.displayedFeaturedData)
    }
    
    func testFetchFeaturedDataWithError() {
        service.errorAPI = .noData
        viewModel.fetchData()
        XCTAssertTrue(delegate.displayedError)
        
    }
}

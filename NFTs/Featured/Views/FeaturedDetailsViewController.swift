//
//  FeaturedDetailsViewController.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 27/03/22.
//

import UIKit

class FeaturedDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nftImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var topBidLabel: UILabel!
    @IBOutlet weak var topBidUsdLabel: UILabel!
    
    // MARK: - Properties
    var nft: NFT?
    
    // MARK: - Initializers
    init(nft: NFT) {
        super.init(nibName: nil, bundle: nil)
        self.nft = nft
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "details"
        setupUI()
    }
    
    func setupUI() {
        nameLabel.text = nft?.name
        descriptionLabel.text = nft?.description
        collectionLabel.text = nft?.collection
        
        if let imageUrl = nft?.image_url, let url = URL(string: imageUrl) {
            nftImageView.kf.setImage(with: url)
        }
        
        if let collection_image_url = nft?.collection_image_url, let url = URL(string: collection_image_url) {
            collectionImageView.kf.setImage(with: url)
        }
        
        topBidLabel.text = nft?.top_bid_weth
        
        if let topBidUsd = nft?.top_bid_dollars {
            topBidUsdLabel.text = "(USD \(topBidUsd))"
        }
    }
    
    private func openURL() {
        if let listing = nft?.listing, let url = URL(string: listing), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func buttonTaped(_ sender: UIButton) {
        openURL()
    }
    
}

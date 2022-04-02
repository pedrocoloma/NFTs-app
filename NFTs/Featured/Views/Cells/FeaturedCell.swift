//
//  FeaturedCell.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 22/03/22.
//

import UIKit

class FeaturedCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nftImageView: UIImageView!
    @IBOutlet weak var collectionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func setup(with nft: NFT?) {
        nftImageView.contentMode = .scaleAspectFill
        if let imageUrl = nft?.image_url, let url = URL(string: imageUrl) {
            nftImageView.kf.setImage(with: url)
        }
        
        if let collection_image_url = nft?.collection_image_url, let url = URL(string: collection_image_url) {
            collectionImageView.kf.setImage(with: url)
        }
        
        nameLabel.text = nft?.name
    }
}

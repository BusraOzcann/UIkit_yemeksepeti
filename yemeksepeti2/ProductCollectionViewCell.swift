//
//  ProductCollectionViewCell.swift
//  yemeksepeti2
//
//  Created by Büşra Özcan on 1.10.2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 10
    }
    
    func configure(with product: Product) {
        imageView.image = UIImage(named: product.image!)
        nameLabel.text = product.name
        categoryLabel.text = product.category
        priceLabel.text = product.price
    }
}

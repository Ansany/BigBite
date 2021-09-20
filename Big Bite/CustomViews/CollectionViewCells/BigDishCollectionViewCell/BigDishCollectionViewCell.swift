//
//  BigDishCollectionViewCell.swift
//  Big Bite
//
//  Created by Andrey Alymov on 17.09.2021.
//

import UIKit

class BigDishCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: BigDishCollectionViewCell.self)
    
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    @IBOutlet weak var dishPriceLabel: UILabel!
    
    func setup(_ category: Dish) {
        dishTitleLabel.text = category.name
        dishImage.image = UIImage(named: "pizza")
        dishDescriptionLabel.text = category.description
        dishPriceLabel.text = category.formatedPrice
    }
    
}

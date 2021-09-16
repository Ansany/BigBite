//
//  CategoryCollectionViewCell.swift
//  Big Bite
//
//  Created by Andrey Alymov on 15.09.2021.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(_ category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImage.kf.setImage(with: category.image.asUrl)
           
    }
}
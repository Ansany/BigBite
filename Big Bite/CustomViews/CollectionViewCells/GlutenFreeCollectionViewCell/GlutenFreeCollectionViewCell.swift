//
//  GlutenFreeCollectionViewCell.swift
//  Big Bite
//
//  Created by Andrey Alymov on 17.09.2021.
//

import UIKit

class GlutenFreeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: GlutenFreeCollectionViewCell.self)
    
    @IBOutlet weak var glutenFreeImage: UIImageView!
    @IBOutlet weak var glutenFreeLabel: UILabel!
    @IBOutlet weak var glutenFreeDescription: UILabel!
    @IBOutlet weak var glutenFreePriceLabel: UILabel!
    
    func setup(_ category: Dish) {
        glutenFreeImage.image = UIImage(named: "GlutenFree")
        glutenFreeLabel.text = category.name
        glutenFreeDescription.text = category.description
        glutenFreePriceLabel.text = category.formatedPrice
    }
    

}

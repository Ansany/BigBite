//
//  BasketTableViewCell.swift
//  Big Bite
//
//  Created by Andrey Alymov on 20.09.2021.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: BasketTableViewCell.self)

    @IBOutlet weak var basketCellImage: UIImageView!
    @IBOutlet weak var basketCellPriceLabel: UILabel!
    @IBOutlet weak var basketCellNameLabel: UILabel!
    
    @IBOutlet weak var basketCellStepper: UIStepper!
    @IBOutlet weak var basketCellCountLabel: UILabel!
    
    var items: Int = 1
    var totalCellPrice : Double = 0
    
    
    func setup(_ category: Dish) {
        basketCellImage.image = UIImage(named: "pizza")
        basketCellPriceLabel.text = category.formatedPrice
        basketCellNameLabel.text = category.name
        totalCellPrice = category.price
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
    
    @IBAction func basketCellStepperPressed(_ sender: UIStepper) {
        basketCellCountLabel.text = String(format: "%.0f", sender.value)
        items = Int (sender.value)
        let price = totalCellPrice * Double(items)
        basketCellPriceLabel.text = String(format: "$ %.2f", price)
        }
    
}
    
    


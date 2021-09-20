//
//  DishListTableViewCell.swift
//  Big Bite
//
//  Created by Andrey Alymov on 20.09.2021.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DishListTableViewCell.self)

    @IBOutlet weak var dishListImageView: UIImageView!
    @IBOutlet weak var dishListTitleLabel: UILabel!
    @IBOutlet weak var dishListPriceLabel: UILabel!
    
    @IBOutlet weak var dishListCounterLabel: UILabel!
    @IBOutlet weak var dishListStepper: UIStepper!
    
    var items: Int = 1
    var totalCellPrice : Double = 0
    
    func setup(_ dish: Dish) {
        dishListImageView.image = UIImage(named: "pizza")
        dishListTitleLabel.text = dish.name
        dishListPriceLabel.text = dish.formatedPrice
    }
    
    
    @IBAction func addPressed(_ sender: UIButton) {
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        dishListCounterLabel.text = String(format: "%.0f", sender.value)
        items = Int (sender.value)
        let price = totalCellPrice * Double(items)
        dishListPriceLabel.text = String(format: "$ %.2f", price)
        }
}
    


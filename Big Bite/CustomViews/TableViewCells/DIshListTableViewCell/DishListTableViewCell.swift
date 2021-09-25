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
    
    var stepperValue: Double = 1
    var totalCellPrice : Double = 0
    
    var dish: Dish!
    var dishListOrder: Order!
    var dishID = ""
    var imageString = ""
    
    
    func setup(_ dish: Dish) {
        dishListImageView.image = UIImage(named: dish.image)
        dishListTitleLabel.text = dish.name
        dishListPriceLabel.text = dish.formatedPrice
        totalCellPrice = dish.price
        dishID = dish.id
        imageString = dish.image
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        dish = .init(id: dishID, name: dishListTitleLabel.text!, description: nil, image: imageString, price: totalCellPrice)
        dishListOrder = .init(amount: stepperValue, dish: dish)
        BasketViewController.orderList.append(dishListOrder)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValue = sender.value
        dishListCounterLabel.text = String(format: "%.0f", stepperValue)
        let price = totalCellPrice * stepperValue
        dishListPriceLabel.text = String(format: "$ %.2f", price)
        }
}
    


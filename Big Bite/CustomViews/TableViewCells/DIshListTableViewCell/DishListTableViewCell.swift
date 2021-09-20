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
    
    var orders: [Order] = []
    
    func setup(_ dish: Dish) {
        dishListImageView.image = UIImage(named: "pizza")
        dishListTitleLabel.text = dish.name
        dishListPriceLabel.text = dish.formatedPrice
        totalCellPrice = dish.price
    }
    
    
    @IBAction func addPressed(_ sender: UIButton) {
        orders.append(.init(id: "id1", amount: stepperValue, dish: .init(id: "id1", name: dishListTitleLabel.text!, description: "2", image: "", price: totalCellPrice)))
        
        stepperValue = 1
        dishListStepper.value = stepperValue
        
        dishListCounterLabel.text = String(Int(stepperValue))
        let price = totalCellPrice * stepperValue
        dishListPriceLabel.text = String(format: "$ %.2f", price)
        
        print(orders)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValue = sender.value
        dishListCounterLabel.text = String(format: "%.0f", stepperValue)
        let price = totalCellPrice * stepperValue
        dishListPriceLabel.text = String(format: "$ %.2f", price)
        }
}
    


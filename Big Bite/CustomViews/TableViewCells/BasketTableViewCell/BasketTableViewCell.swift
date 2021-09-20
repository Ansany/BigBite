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
    
    var stepperValue: Double = 1
    var totalCellPrice : Double = 0
    
    
    func setup(_ order: Order) {
        basketCellImage.image = UIImage(named: "pizza")
        basketCellPriceLabel.text = String(format: "$ %.2f", (order.dish.price * order.amount))
        basketCellNameLabel.text = order.dish.name
        basketCellStepper.value = order.amount
        basketCellCountLabel.text = String(Int(order.amount))
        totalCellPrice = order.dish.price
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
    
    @IBAction func basketCellStepperPressed(_ sender: UIStepper) {
        stepperValue = sender.value
        basketCellCountLabel.text = String(format: "%.0f", stepperValue)
        let price = totalCellPrice * stepperValue
        basketCellPriceLabel.text = String(format: "$ %.2f", price)
        }
    
}
    
    


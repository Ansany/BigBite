//
//  DishListTableViewCell.swift
//  Big Bite
//
//  Created by Andrey Alymov on 20.09.2021.
//

import UIKit
import Firebase

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DishListTableViewCell.self)
    
    let db = Firestore.firestore()

    @IBOutlet weak var dishListImageView: UIImageView!
    @IBOutlet weak var dishListTitleLabel: UILabel!
    @IBOutlet weak var dishListPriceLabel: UILabel!
    
    @IBOutlet weak var dishListCounterLabel: UILabel!
    @IBOutlet weak var dishListStepper: UIStepper!
    
    var stepperValue: Double = 1
    var totalCellPrice : Double = 0
    
    var dish: Dish!
    var dishListOrder: Order!
    
    func setup(_ dish: Dish) {
        dishListImageView.image = UIImage(named: "pizza")
        dishListTitleLabel.text = dish.name
        dishListPriceLabel.text = dish.formatedPrice
        totalCellPrice = dish.price
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        dish = .init(id: nil, name: dishListTitleLabel.text!, description: nil, image: nil, price: totalCellPrice)
        dishListOrder = .init(amount: stepperValue, dish: dish)
        
        
        db.collection("DishDetail").addDocument(data: [
            "amount": stepperValue, "dishName":  dishListOrder.dish.name,
            "price": dishListOrder.dish.price
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValue = sender.value
        dishListCounterLabel.text = String(format: "%.0f", stepperValue)
        let price = totalCellPrice * stepperValue
        dishListPriceLabel.text = String(format: "$ %.2f", price)
        }
}
    


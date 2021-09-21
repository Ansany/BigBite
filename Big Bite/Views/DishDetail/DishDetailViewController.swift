//
//  DishDetailViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 18.09.2021.
//

import UIKit
import Firebase

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dishStepper: UIStepper!
    @IBOutlet weak var dishCounterLabel: UILabel!
            
    var dish: Dish!
    var items = 1
        
    var dishOrder: Order!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        dishImageView.image = UIImage(named: "GlutenFree")
        titleLabel.text = dish.name
        priceLabel.text = dish.formatedPrice
        descriptionLabel.text = dish.description
    }
    
    @IBAction func placeOrderPressed(_ sender: UIButton) {
        dishOrder = .init(amount: dishStepper.value, dish: dish)
        
        db.collection("DishDetail").addDocument(data: [
            "amount": dishOrder.amount, "dishName":  dishOrder.dish.name,
            "price": dishOrder.dish.price
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        }
    
    @IBAction func dishStepperPressed(_ sender: UIStepper) {
        dishCounterLabel.text = String(format: "%.0f", sender.value)
        items = Int (sender.value)
        let price = dish.price * Double(items)
        priceLabel.text = String(format: "$ %.2f", price)
        }

}




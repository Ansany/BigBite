//
//  DishDetailViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 18.09.2021.
//

import UIKit

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
    var numberOfOrder = Int.random(in: 1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        dishImageView.image = UIImage(named: dish.image)
        titleLabel.text = dish.name
        priceLabel.text = dish.formatedPrice
        descriptionLabel.text = dish.description
    }
    
    @IBAction func placeOrderPressed(_ sender: UIButton) {
        dishOrder = Order(amount: dishStepper.value, dish: dish)
        BasketViewController.orderList.append(dishOrder)
        }
    
    @IBAction func dishStepperPressed(_ sender: UIStepper) {
        dishCounterLabel.text = String(format: "%.0f", sender.value)
        items = Int (sender.value)
        let price = dish.price * Double(items)
        priceLabel.text = String(format: "$ %.2f", price)
        }

}




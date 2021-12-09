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
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var dish: Dish!
    var items = 1
    var dishOrder: Order!
    
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
        dishOrder = Order(amount: dishStepper.value, totalPrice: (dishStepper.value * dish.price), dish: dish)
        BasketViewController.orderList.append(dishOrder)
        placeOrderButton.backgroundColor = UIColor(red: 0.33, green: 0.94, blue: 0.77, alpha: 1.00)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.dismiss(animated: true, completion: nil)
        }
        }
    
    @IBAction func dishStepperPressed(_ sender: UIStepper) {
        dishCounterLabel.text = String(format: "%.0f", sender.value)
        items = Int (sender.value)
        let price = dish.price * Double(items)
        priceLabel.text = String(format: "$ %.2f", price)
        }

}




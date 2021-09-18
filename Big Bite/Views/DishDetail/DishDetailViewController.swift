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
    @IBOutlet weak var dishCounter: UILabel!
    
    var dish: Dish!
    var items = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dishStepper.value = 1
        setup()

    }
    
    private func setup() {
        dishImageView.image = UIImage(named: "GlutenFree")
        titleLabel.text = dish.name
        priceLabel.text = dish.formattedCost
        descriptionLabel.text = dish.description
    }
    
    @IBAction func placeOrderPressed(_ sender: UIButton) {
    }
    
    @IBAction func dishStepperPressed(_ sender: UIStepper) {
        dishCounter.text = String(format: "%.0f", sender.value)
        items = Int (sender.value)
            
        }
}




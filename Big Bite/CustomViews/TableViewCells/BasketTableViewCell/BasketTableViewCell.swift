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
    @IBOutlet weak var basketCellCountLabel: UILabel!
     
    private func setup(_ order: Order) {
        basketCellImage.image = UIImage(named: order.dish.image)
        basketCellPriceLabel.text = String(format: "$ %.2f", (order.totalPrice))
        basketCellNameLabel.text = order.dish.name
        basketCellCountLabel.text = "x \(Int(order.amount))"
    }
    
}
    
    


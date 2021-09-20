//
//  Dish.swift
//  Big Bite
//
//  Created by Andrey Alymov on 17.09.2021.
//

import Foundation

struct Dish {
    let id, name, description, image: String
    let price: Double
    
    var formatedPrice: String {
        return String(format: "$ %.2f", price)
    }
}

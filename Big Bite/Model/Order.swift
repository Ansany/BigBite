//
//  Order.swift
//  Big Bite
//
//  Created by Andrey Alymov on 20.09.2021.
//

import Foundation

public struct Order: Codable {
    let amount: Double
    let dish: Dish
}

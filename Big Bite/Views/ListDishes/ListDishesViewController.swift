//
//  ListDishesViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 20.09.2021.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var listDishTableView: UITableView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    var category: DishCategory!
    var dishes: [Dish] = [
        .init(id: "id1", name: "Margaritta", description: "This is the best pizza in the world", image: "Pizza", price: 8.4532),
        .init(id: "id2 ", name: "Pepperoni", description: "This is the best pizza in the world", image: "Pizza",price: 12.0023),
        .init(id: "id3", name: "Terolla", description: "This is the best pizza in the world", image: "Pizza", price: 14),
        .init(id: "id4", name: "Likonia", description: "This is the best pizza in the world", image: "Pizza", price: 8.4324)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        categoryNameLabel.text = category.name

    }
    
    private func registerCells() {
        listDishTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension ListDishesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dishes[indexPath.row])
        return cell
    }
    
    
}

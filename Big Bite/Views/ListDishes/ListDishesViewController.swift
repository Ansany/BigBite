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
    
    var burgersCategory: [Dish] = [
        .init(id: "id1", name: "Black Star", description: nil, image: "BurgerImage", price: K.DishPrice.Burgers.blackStar),
        .init(id: "id2 ", name: "Falconi", description: nil, image: "BurgerImage",price: K.DishPrice.Burgers.falconi),
        .init(id: "id3", name: "Smokey Burger", description: nil, image: "BurgerImage", price: K.DishPrice.Burgers.smokeyBurger),
        .init(id: "id4", name: "Big Mac", description: nil, image: "BurgerImage", price: K.DishPrice.Burgers.bigMac)
    ]
    var pizzaCategory: [Dish] = [
        .init(id: "id5", name: "Margaritta", description: nil, image: "pizza", price: 7.20),
        .init(id: "id6", name: "Pepperoni", description: nil, image: "pizza", price: 9.45),
        .init(id: "id7", name: "Buffalo", description: nil, image: "pizza", price: 11.70)
    ]
    var sushiCategory: [Dish] = [
        .init(id: "id8", name: "Unagi-Maki", description: nil, image: "Sushi", price: 5),
        .init(id: "id9", name: "Filadelfia", description: nil, image: "Sushi", price: 7.2),
        .init(id: "id10", name: "Avakado", description: nil, image: "Sushi", price: 14.70)
    ]
    var saladsCategory: [Dish] = [
        .init(id: "id8", name: "Cesar", description: nil, image: "pizza", price: 6.1),
        .init(id: "id9", name: "Olivie", description: nil, image: "pizza", price: 4.6),
    ]
    var drinksCategory: [Dish] = [
        .init(id: "id10", name: "Cola", description: nil, image: "pizza", price: 2),
        .init(id: "id11", name: "Sprite", description: nil, image: "pizza", price: 2),
        .init(id: "id12", name: "Fanta", description: nil, image: "pizza", price: 2)
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
        switch category.name {
        case "Burgers":
            return burgersCategory.count
        case "Pizza":
            return pizzaCategory.count
        case "Sushi":
            return sushiCategory.count
        case "Salads":
            return saladsCategory.count
        case "Drinks":
            return drinksCategory.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch category.name {
        case "Burgers":
            let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
            cell.setup(burgersCategory[indexPath.row])
            return cell
        case "Pizza":
            let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
            cell.setup(pizzaCategory[indexPath.row])
            return cell
        case "Sushi":
            let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
            cell.setup(sushiCategory[indexPath.row])
            return cell
        case "Salads":
            let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
            cell.setup(saladsCategory[indexPath.row])
            return cell
        case "Drinks":
            let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
            cell.setup(drinksCategory[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    
    
}
}

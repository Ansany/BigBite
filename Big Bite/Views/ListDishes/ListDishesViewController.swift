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
    
    var burgersCategory: [Dish] = [Menu.Burgers.blackStar, Menu.Burgers.falconi, Menu.Burgers.lucien, Menu.Burgers.macRow, Menu.Burgers.smokey]
    var pizzaCategory: [Dish] = [Menu.Pizza.californiaStyle, Menu.Pizza.greekStyle, Menu.Pizza.margherita, Menu.Pizza.pepperoni]
    var sushiCategory: [Dish] = [Menu.Sushi.makizushi, Menu.Sushi.unagiNigiri, Menu.Sushi.uramaki]
    var saladsCategory: [Dish] = [Menu.Salads.blackBean, Menu.Salads.caesar, Menu.Salads.olivier]
    var drinksCategory: [Dish] = [Menu.Drinks.cola, Menu.Drinks.fanta, Menu.Drinks.sprite, Menu.Drinks.berryJuice, Menu.Drinks.water]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if category.name == "Burgers" {
            let controller = DishDetailViewController.instantiate()
            controller.dish = burgersCategory[indexPath.row]
            tabBarController?.present(controller, animated: true, completion: nil)
        } else if category.name == "Pizza"{
            let controller = DishDetailViewController.instantiate()
            controller.dish = pizzaCategory[indexPath.row]
            tabBarController?.present(controller, animated: true, completion: nil)
        } else if category.name == "Sushi"{
            let controller = DishDetailViewController.instantiate()
            controller.dish = sushiCategory[indexPath.row]
            tabBarController?.present(controller, animated: true, completion: nil)
        } else if category.name == "Salads"{
            let controller = DishDetailViewController.instantiate()
            controller.dish = saladsCategory[indexPath.row]
            tabBarController?.present(controller, animated: true, completion: nil)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = drinksCategory[indexPath.row]
            tabBarController?.present(controller, animated: true, completion: nil)
        }
    }
    
}

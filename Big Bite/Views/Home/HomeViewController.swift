//
//  HomeViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 15.09.2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var glutenFreeCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [Menu.Categories.burgerCategory, Menu.Categories.pizzaCategory, Menu.Categories.sushiCategory, Menu.Categories.saladCategory, Menu.Categories.drinkCategory]
    var popularDish: [Dish] = [Menu.Pizza.californiaStyle, Menu.Burgers.blackStar, Menu.Sushi.unagiNigiri, Menu.Pizza.pepperoni]
    var glutenFreeDishes: [Dish] = [Menu.GlutenFree.glazedSalmon, Menu.GlutenFree.larendy, Menu.GlutenFree.skillet]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: BigDishCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BigDishCollectionViewCell.identifier)
        glutenFreeCollectionView.register(UINib(nibName: GlutenFreeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GlutenFreeCollectionViewCell.identifier)
    }

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDish.count
        case glutenFreeCollectionView:
            return glutenFreeDishes.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                as! CategoryCollectionViewCell
            cell.setup(categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigDishCollectionViewCell.identifier, for: indexPath)
                as! BigDishCollectionViewCell
            cell.setup(popularDish[indexPath.row])
            return cell
        case glutenFreeCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlutenFreeCollectionViewCell.identifier, for: indexPath) as! GlutenFreeCollectionViewCell
            cell.setup(glutenFreeDishes[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? popularDish[indexPath.row] : glutenFreeDishes[indexPath.row]
            tabBarController?.present(controller, animated: true, completion: nil)
        }
    }
}

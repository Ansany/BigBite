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
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Burgers", image: "BurgerImage"),
        .init(id: "id2", name: "Pizza", image: "pizza"),
        .init(id: "id3", name: "Sushi", image: "Sushi"),
        .init(id: "id3", name: "Salads", image: "BurgerImage"),
        .init(id: "id3", name: "Drinks", image: "BurgerImage")
    ]
    
    var dish: [Dish] = [
        .init(id: "id1", name: "Margaritta", description: "This is the best pizza in the world", image: "pizza", price: 8.4),
        .init(id: "id1", name: "Black Star", description: "This is the best burger in the world", image: "BurgerImage", price: K.DishPrice.Burgers.blackStar),
        .init(id: "id3", name: "Terolla", description: "This is the best pizza in the world", image: "pizza", price: 14),
        .init(id: "id4", name: "Likonia", description: "This is the best pizza in the world", image: "pizza", price: 8.4)
    ]
    
    var glutenFreeDishes: [Dish] = [
        .init(id: "id1", name: "Glazed Salmon", description: "Gluten Free Asian Glazed Salmon with Edamame Rice", image: "BurgerImage", price: 18),
        .init(id: "id2", name: "Tokkei", description: "Gluten Free Asian Glazed Salmon with Edamame Rice", image: "Sushi", price: 12.8),
        .init(id: "id3", name: "Larendy", description: "Gluten Free Asian Glazed Salmon with Edamame Rice", image: "pizza", price: 6.1)
    ]
    
    
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
            return dish.count
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
            cell.setup(dish[indexPath.row])
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
            tabBarController?.present(controller, animated: true, completion: nil)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? dish[indexPath.row] : glutenFreeDishes[indexPath.row]
            tabBarController?.present(controller, animated: true, completion: nil)
        }
    }
}

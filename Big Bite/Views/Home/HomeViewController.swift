//
//  HomeViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 15.09.2021.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Burgers", image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpngtree.com%2Fso%2Ffood&psig=AOvVaw0OLpqDGShsDDRZaAAkyXwv&ust=1631836834908000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOjt-YiYgvMCFQAAAAAdAAAAABAO"),
        .init(id: "id2", name: "Pizza", image: "https://picsum.photo/100"),
        .init(id: "id3", name: "Sushi", image: "https://picsum.photo/100"),
        .init(id: "id3", name: "Salads", image: "https://picsum.photo/100"),
        .init(id: "id3", name: "Drinks", image: "https://picsum.photo/100")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
            as! CategoryCollectionViewCell
        cell.setup(categories[indexPath.row])
        return cell
    }
    
    
}

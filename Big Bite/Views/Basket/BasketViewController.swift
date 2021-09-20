//
//  BasketViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 18.09.2021.
//

import UIKit

class BasketViewController: UIViewController {
    
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    
    var orderList: [Dish] = [
        .init(id: "id22", name: "Mozarella", description: "ssd", image: "w", price: 12.30),
        .init(id: "id22", name: "Pepperoni", description: "ssd", image: "w", price: 8.10),
        .init(id: "id22", name: "Lemonia", description: "ssd", image: "w", price: 9),
        .init(id: "id22", name: "Koka", description: "ssd", image: "w", price: 10),
        .init(id: "id22", name: "Feroum", description: "ssd", image: "w", price: 2),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()

    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
    }
    
    private func registerCells() {
        basketTableView.register(UINib(nibName: BasketTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BasketTableViewCell.identifier)
    }

}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier) as! BasketTableViewCell
        cell.setup(orderList[indexPath.row])
        return cell
    }
    
    
}

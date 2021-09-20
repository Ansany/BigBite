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
    
    
    var orderList: [Order] = [
        .init(id: "id1", amount: 1, dish: .init(id: "id1", name: "Mozarella", description: "Mozarela pizza", image: "1", price: 12.20)),
        .init(id: "id1", amount: 2, dish: .init(id: "id1", name: "Pepperoni", description: "Mozarela pizza", image: "1", price: 8.50)),
        .init(id: "id1", amount: 3, dish: .init(id: "id1", name: "Likanchi", description: "Mozarela pizza", image: "1", price: 4.10))
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

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
    
    let loginVC = LoginViewController()
    
    static var orderList: [Order] = []
    var totalPriceValue: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupOrders()
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
    }
    
    private func registerCells() {
        basketTableView.register(UINib(nibName: BasketTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BasketTableViewCell.identifier)
    }
    
    func updateTotalPrice() {
        totalPriceValue = 0
        for order in BasketViewController.orderList {
            totalPriceValue += (order.amount * order.dish.price)
        }
        totalPrice.text = String(format: "$ %.2f", totalPriceValue)
    }
    
    func setupOrders() {
        DispatchQueue.main.async {
            self.updateTotalPrice()
            self.basketTableView.reloadData()
        }
    }

    
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BasketViewController.orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier) as! BasketTableViewCell
        cell.setup(BasketViewController.orderList[indexPath.row])
        return cell
    }
    
}



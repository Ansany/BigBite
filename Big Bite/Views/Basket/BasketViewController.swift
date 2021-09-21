//
//  BasketViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 18.09.2021.
//

import UIKit
import Firebase

class BasketViewController: UIViewController {
    
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var orderList: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        print(orderList)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupOrders()
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
    }
    
    private func registerCells() {
        basketTableView.register(UINib(nibName: BasketTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BasketTableViewCell.identifier)
    }
    
    func setupOrders() {
        orderList = []
        db.collection("DishDetail").getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from Firedtore\(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let name = data["dishName"] as! String
                        let amount = data["amount"] as! Double
                        let price = data["price"] as! Double
                        let newOrder = Order(amount: amount, dish: .init(id: nil, name: name, description: nil, image: nil, price: price))
                        self.orderList.append(newOrder)
                        
                        DispatchQueue.main.async {
                            self.basketTableView.reloadData()
                        }
                    }
                }
            }
        }
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



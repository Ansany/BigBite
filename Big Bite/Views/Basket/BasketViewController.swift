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
        
    static var orderList: [Order] = []
    static var totalPriceValue: Double = 0
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupOrders()
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {

        if let collectionName = Auth.auth().currentUser?.email {
            for order in BasketViewController.orderList {
                db.collection(collectionName).addDocument(data: ["Amount": order.amount, "DishName": order.dish.name, "TotalPrice": order.totalPrice, "Date": Date().timeIntervalSince1970]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document was added")
                    }
                }
            }
            BasketViewController.orderList = []
            setupOrders()
        } else {
            print("Problems with firebase")
        }
        
    }
    
    private func registerCells() {
        basketTableView.register(UINib(nibName: BasketTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BasketTableViewCell.identifier)
    }
    
    func updateTotalPrice() {
        BasketViewController.totalPriceValue = 0
        for order in BasketViewController.orderList {
            BasketViewController.totalPriceValue += order.totalPrice
        }
        totalPrice.text = String(format: "$ %.2f", BasketViewController.totalPriceValue)
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            BasketViewController.orderList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            updateTotalPrice()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}

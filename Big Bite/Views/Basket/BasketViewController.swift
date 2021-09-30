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
    @IBOutlet weak var promoButton: UIButton!
    
    static var orderList: [Order] = []
    var totalPriceValue: Double = 0
    var discountValue: Double = 0
    var promoIsAccept: Bool { discountValue == 0 ? false : true }

    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupOrders()
    }
    
    @IBAction func promoPressed(_ sender: UIButton) {
        showPromoAlert()
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
        
        setupInformationAlert(alertTitle: "Succes", alertMessage: "Your order has been sent, please expect delivery within 1 hour", actionTitle: "OK")
    
        if let collectionName = Auth.auth().currentUser?.email {
            for order in BasketViewController.orderList {
                db.collection(collectionName).addDocument(data: ["Amount": order.amount, "DishName": order.dish.name, "TotalPrice": order.totalPrice, "Discount": promoIsAccept, "Date": Date().timeIntervalSince1970]) { err in
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
            setupInformationAlert(alertTitle: "Error", alertMessage: "Please log in to the account tab, to place an order", actionTitle: "OK")
        }
        
    }
    
    private func registerCells() {
        basketTableView.register(UINib(nibName: BasketTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BasketTableViewCell.identifier)
    }
    
    func updateTotalPrice() {
        totalPriceValue = 0
        for order in BasketViewController.orderList {
            totalPriceValue += order.totalPrice
        }
        totalPriceValue = totalPriceValue - (totalPriceValue * discountValue)
        totalPrice.text = String(format: "$ %.2f", totalPriceValue)
    }
    
    func setupOrders() {
        DispatchQueue.main.async {
            self.updateTotalPrice()
            self.basketTableView.reloadData()
        }
    }
    
    func showPromoAlert() {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Get your discount", message: nil, preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Put your code here"
            textField = alertTextField
        }
        
        let add = UIAlertAction(title: "Add", style: .default) { action in
            if textField.text == "FirstOrder" {
                self.discountValue = 0.2
                self.updateTotalPrice()
                self.promoButton.backgroundColor = .init(red: 0.47, green: 0.88, blue: 0.56, alpha: 1)
                self.setupInformationAlert(alertTitle: "Success", alertMessage: "You have been assigned a discount of 20%", actionTitle: "OK")
            } else {
                self.promoButton.backgroundColor = .init(red: 0.90, green: 0.31, blue: 0.22, alpha: 1)
                self.setupInformationAlert(alertTitle: "Unsuccessfully", alertMessage: "Non-existent code entered", actionTitle: "OK")
                return
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(add)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        
        if BasketViewController.orderList.count == 0 {
            noDataLabel.isHidden = false
            noDataLabel.text = "Your basket is empty now. Please select some dishes to order."
            noDataLabel.textColor = .black
            noDataLabel.numberOfLines = 2
            noDataLabel.backgroundColor = .white
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
            return 0
        } else {
            noDataLabel.backgroundColor = .clear
            noDataLabel.isHidden = true
            tableView.backgroundView  = nil
            return BasketViewController.orderList.count
        }
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
    
}

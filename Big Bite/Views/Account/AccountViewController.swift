//
//  AccountViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 22.09.2021.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var accountStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let userPhoneNumber = Auth.auth().currentUser?.phoneNumber {
            accountStatusLabel.text = "User: \(userPhoneNumber) has login."
        } else {
            let controller = PhoneAuthViewController.instantiate()
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        let controller = PhoneAuthViewController.instantiate()
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            accountStatusLabel.text = "Sign out succes"
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            accountStatusLabel.text = "Error signing out"
        }
    }
}




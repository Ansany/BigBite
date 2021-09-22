//
//  RegistrationViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 22.09.2021.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.text = e.localizedDescription
                } else {
                    print("User was created")
//                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
    }
    
    
}

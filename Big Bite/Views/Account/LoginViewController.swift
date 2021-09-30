//
//  AccountViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 18.09.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    public var userName: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.text = e.localizedDescription
                } else {
                    self.userName = email
                    print("User \(self.userName ?? "1") is login")
//                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    

    

}

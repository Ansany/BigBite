//
//  SMSCodeViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 02.10.2021.
//

import UIKit
import FirebaseAuth

class CodeViewController: UIViewController {

    @IBOutlet weak var smsCodeTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        sendCode()
    }
    
    @IBAction func errorButtonPressed(_ sender: UIButton) {
        errorLabel.text = "Wait please, or try again later"
    }
    
    func sendCode() {
        if let text = smsCodeTextField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(identifier: "TabBarController") as! UITabBarController
                    controller.modalPresentationStyle = .fullScreen
                    self?.present(controller, animated: true, completion: nil)
                }
            }
        } else {
            errorLabel.text = "Put your SMS code please"
        }
    }
    
}

//MARK: - UITextFieldDelegate

extension CodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendCode()
        return true
    }

}

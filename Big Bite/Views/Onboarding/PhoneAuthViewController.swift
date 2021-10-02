//
//  PhoneAuthViewController.swift
//  Big Bite
//
//  Created by Andrey Alymov on 02.10.2021.
//

import UIKit
import FirebaseAuth

class PhoneAuthViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        sendPhoneNumber()
    }
    
    func sendPhoneNumber() {
        if let text = phoneNumberTextField.text, !text.isEmpty {
            let number = "+1\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let controller = CodeViewController.instantiate()
                    self?.present(controller, animated: true, completion: nil)
                }
            }
        } else {
            errorLabel.text = "Please put your phone number. For example: 9214425228"
        }
    }
    
}

//MARK: - UITextFieldDelegate

extension PhoneAuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendPhoneNumber()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 10 characters
        return updatedText.count <= 10
 
    }
}

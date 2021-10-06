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
    
    @IBOutlet weak var step2Label: UILabel!
    @IBOutlet weak var smsTextField: UITextField!
    @IBOutlet weak var sendSmsButton: UIButton!
    @IBOutlet weak var errorSmsLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSecondStep(isHidden: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (Auth.auth().currentUser?.phoneNumber) != nil {
            self.dismiss(animated: true, completion: nil)
            setupInformationAlert(alertTitle: "You are already signed in", alertMessage: "If you want to change your account, press Sign Out button", actionTitle: "OK")
        } else {
            return
        }
    }
    
    @IBAction func sendPhoneNumberPressed(_ sender: UIButton) {
        sendPhoneNumber()
    }
    
    @IBAction func sendSmsPressed(_ sender: UIButton) {
        sendSmsCode()
    }
    
    func sendSmsCode() {
        if let text = smsTextField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
                guard success else { return }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    let alert = UIAlertController(title: "Success", message: "Press OK to continue", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                        self?.dismiss(animated: true, completion: nil)
                    }))
                    self?.present(alert, animated: true, completion: nil)
                }
                
            }
        } else {
            errorLabel.text = "Put your SMS code please"
        }
    }
    
    func sendPhoneNumber() {
        if let text = phoneNumberTextField.text, !text.isEmpty {
            let number = "+1\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self?.showSecondStep(isHidden: false)
                }
            }
        } else {
            errorLabel.text = "Please put your phone number. For example: 9214425228"
        }
    }
    
    func showSecondStep(isHidden: Bool) {
        if isHidden == true {
            step2Label.isHidden = true
            smsTextField.isHidden = true
            sendSmsButton.isHidden = true
            errorSmsLabel.isHidden = true
        } else {
            step2Label.isHidden = false
            smsTextField.isHidden = false
            sendSmsButton.isHidden = false
            errorSmsLabel.isHidden = false
        }
    }
    
}

//MARK: - UITextFieldDelegate

extension PhoneAuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case phoneNumberTextField:
            sendPhoneNumber()
            return true
        case smsTextField:
            sendSmsCode()
            return true
        default:
            return true
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case phoneNumberTextField:
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 10
        case smsTextField:
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 6
        default:
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 10
        }
        
    }
}

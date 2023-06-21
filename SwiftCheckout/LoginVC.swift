//
//  LoginVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 154 on 2023/06/13.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    
    private var errorLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView()
        myView.backgroundColor = UIColor.darkGreen
        
        userName.layer.borderColor = UIColor.darkGreen.cgColor
        
        userName.layer.borderWidth = 1.0
        userName.layer.cornerRadius = 18.0
        userName.autocorrectionType = .no
        
        password.layer.borderColor = UIColor.darkGreen.cgColor
        
        password.layer.borderWidth = 1.0
        password.layer.cornerRadius = 18.0
        password.autocorrectionType = .no
        
        LoginBtn.layer.borderWidth = 1.0
        LoginBtn.layer.cornerRadius = 18.0
        LoginBtn.layer.borderColor = UIColor.darkGreen.cgColor
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        

        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userName.frame.height))
        userName.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        
        LoginBtn.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func  loginButtonTapped(_ sender: UIButton) {
        validateFields()
    }
    
    func validateFields() {
        view.endEditing(true)
        
        var errorMessages: [UITextField: String] = [:]
        
        guard let username = userName.text,
              let passWord = password.text else {
            return
        }
        
        if username.isEmpty {
            errorMessages[userName] = "*Please enter a username."
        }
        
        if passWord.isEmpty {
            errorMessages[password] = "*Please enter a password."
        }
        
        if errorMessages.isEmpty {
            clearErrorMessages()
            login()
        } else {
            showErrorMessages(errorMessages)
        }
    }
    
    func showErrorMessages(_ messages: [UITextField: String]) {
        clearErrorMessages()
        
        for (textField, message) in messages {
            let errorLabel = UILabel()
            errorLabel.text = message
            errorLabel.textColor = .red
            errorLabel.font = textField.font?.withSize(12)
            errorLabel.translatesAutoresizingMaskIntoConstraints = false
            if let superview = textField.superview {
                superview.addSubview(errorLabel)
                errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4).isActive = true
                errorLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
            }
        }
    }

    func clearErrorMessages() {
        for errorLabel in errorLabels {
            errorLabel.removeFromSuperview()
        }
        errorLabels.removeAll()
    }
    
    func login() {
        // Perform login logic
        // ...
        // Show success modal
        showSuccessModal()
    }
    
    func showSuccessModal() {
            let successModalVC = SuccessModalVC()
            successModalVC.modalPresentationStyle = .overFullScreen
            self.present(successModalVC, animated: true, completion: nil)
        }
    
    @IBAction func linkClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VieAllVC") as! ViewAllVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


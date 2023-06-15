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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView()
        myView.backgroundColor = UIColor.darkGreen
        
        userName.layer.borderColor = UIColor.darkGreen.cgColor
        
        userName.layer.borderWidth = 1.0
        userName.layer.cornerRadius = 18.0
        
        password.layer.borderColor = UIColor.darkGreen.cgColor
        
        password.layer.borderWidth = 1.0
        password.layer.cornerRadius = 18.0
        
        LoginBtn.layer.borderWidth = 1.0
        LoginBtn.layer.cornerRadius = 18.0
        LoginBtn.layer.borderColor = UIColor.darkGreen.cgColor
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        

        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userName.frame.height))
        userName.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        
        LoginBtn.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
                
        
//        self.modalPresentationStyle = .fullScreen
//        
//        let LoginVC = LoginVC()
//        self.present(LoginVC, animated: true, completion: nil)
//        
//        self.dismiss(animated: true, completion: nil)


    }
    @objc func loginButtonTapped(_ sender: UIButton) {
            validateFields()
        }
    func validateFields() {
            view.endEditing(true)
            
            guard let username = userName.text,
                  let password = password.text else {
                return
            }
            
            if username.isEmpty || password.isEmpty {
                showAlert(withTitle: "Error", message: "Please fill in all required fields.")
            } else {
                login(username: username, password: password)
            }
        }
    func login(username: String, password: String) {
        // Perform login logic
        // ...
        // If login is successful, navigate to the next screen
        navigateToNextScreen()
    }
    func showAlert(withTitle title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        func navigateToNextScreen() {
            // Navigate to the next screen
        }

    @IBAction func linkClick2(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC else {
            return }
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


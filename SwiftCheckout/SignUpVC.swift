//
//  SignUpVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 154 on 2023/06/13.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName1: UITextField!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let myView = UIView()
        myView.backgroundColor = UIColor.darkGreen
        
        
        userName1.layer.borderColor = UIColor.darkGreen.cgColor
        
        userName1.layer.borderWidth = 1.0
        userName1.layer.cornerRadius = 18.0
        
        email.layer.borderColor = UIColor.darkGreen.cgColor
        
        email.layer.borderWidth = 1.0
        email.layer.cornerRadius = 18.0
        
        password1.layer.borderColor = UIColor.darkGreen.cgColor
        
        password1.layer.borderWidth = 1.0
        password1.layer.cornerRadius = 18.0
        
        confirmPassword.layer.borderColor = UIColor.darkGreen.cgColor
        
        confirmPassword.layer.borderWidth = 1.0
        confirmPassword.layer.cornerRadius = 18.0
        
        SignUpBtn.layer.borderWidth = 1.0
        SignUpBtn.layer.cornerRadius = 18.0
        SignUpBtn.layer.borderColor = UIColor.darkGreen.cgColor
        
        userName1.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userName1.frame.height))
        userName1.leftViewMode = .always
        
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.leftViewMode = .always
        
        password1.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password1.frame.height))
        password1.leftViewMode = .always
        
        confirmPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: confirmPassword.frame.height))
        confirmPassword.leftViewMode = .always
        
        SignUpBtn.addTarget(self, action: #selector(registerButtonTapped(_:)), for: .touchUpInside)

        
    }
    @objc func registerButtonTapped(_ sender: UIButton) {
            validateFields()
        }
    func validateFields() {
            view.endEditing(true)
            
            guard let username = userName1.text,
                  let email = email.text,
                  let password = password1.text,
                  let confirm = confirmPassword.text else {
                      return
            }
        if username.isEmpty || email.isEmpty || password.isEmpty || confirm.isEmpty {
                    showAlert(withTitle: "Error", message: "Please fill in all required fields.")
                } else if !isValidEmail(email) {
                    showAlert(withTitle: "Error", message: "Please enter a valid email address.")
                } else if !isValidPassword(password) {
                    showAlert(withTitle: "Error", message: "Please enter a valid password (Password must have 8 characters including at least one uppercase letter, at least one lowercase letter, at least one number and at least one special character).")
                } else if password != confirm {
                    showAlert(withTitle: "Error", message: "Passwords don't match.")
                } else {
                    signUp()
                }
            }
    func isValidEmail(_ email: String) -> Bool {
          let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
          let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
          return emailPredicate.evaluate(with: email)
      }
      
      func isValidPassword(_ password: String) -> Bool {
          // Check if the password length is at least 8 characters
             if password.count < 8 {
                 return false
             }
             
             // Check if the password contains at least one uppercase letter
             if password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) == nil {
                 return false
             }
             
             // Check if the password contains at least one lowercase letter
             if password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) == nil {
                 return false
             }
             
             // Check if the password contains at least one digit
             if password.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil {
                 return false
             }
             
             // Check if the password contains at least one special character
             let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[]{}|\\;:'\",.<>/?")
             if password.rangeOfCharacter(from: specialCharacterSet) == nil {
                 return false
             }
             
             return true
         }

      
      
      func showAlert(withTitle title: String, message: String) {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          present(alert, animated: true, completion: nil)
      }
    func signUp() {
            // Perform sign up logic
            // ...
            // Show success modal
            showSuccessModal()
        }
        
    @IBAction func linkClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showSuccessModal() {
            let successModalVC = SuccessModalVC()
            successModalVC.modalPresentationStyle = .overFullScreen
            self.present(successModalVC, animated: true, completion: nil)
        }
    
}
extension UIColor {
    static var darkGreen: UIColor {
        return UIColor(red: 164/255, green: 191/255, blue: 139/255, alpha: 1.0)
    }
}


//func addAlert(message: String, title: String) {
//        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)
//
//        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: { _ in
//                //Cancel Action
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }









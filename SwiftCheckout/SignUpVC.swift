//
//  SignUpVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 154 on 2023/06/13.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName1: UITextField!
    
    @IBOutlet weak var LoginBtn: UIButton!
    private var errorLabels: [UILabel] = []
    
    var passwordToggleImageView: UIImageView!
    var confirmPasswordToggleImageView: UIImageView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        setupPasswordTextField()
        setupConfirmPasswordTextField()
                
        
        let myView = UIView()
        myView.backgroundColor = UIColor.darkGreen
        
        
        userName1.layer.borderColor = UIColor.darkGreen.cgColor
        
        userName1.layer.borderWidth = 1.0
        userName1.layer.cornerRadius = 18.0
        userName1.autocorrectionType = .no
        
        email.layer.borderColor = UIColor.darkGreen.cgColor
        
        email.layer.borderWidth = 1.0
        email.layer.cornerRadius = 18.0
        email.autocorrectionType = .no
        
        password1.layer.borderColor = UIColor.darkGreen.cgColor
        
        password1.layer.borderWidth = 1.0
        password1.layer.cornerRadius = 18.0
        password1.autocorrectionType = .no
        
        confirmPassword.layer.borderColor = UIColor.darkGreen.cgColor
        
        confirmPassword.layer.borderWidth = 1.0
        confirmPassword.layer.cornerRadius = 18.0
        confirmPassword.autocorrectionType = .no
        
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
    
    func setupPasswordTextField() {
            let passwordRightView = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 24))
            let passwordContentView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 24))
            
            passwordToggleImageView = UIImageView(image: UIImage(named: "closedeye"))
            passwordToggleImageView.contentMode = .scaleAspectFit
            passwordToggleImageView.frame = CGRect(x: 6, y: 0, width: 24, height: 24)
            passwordContentView.addSubview(passwordToggleImageView)
            
            let passwordTapGesture = UITapGestureRecognizer(target: self, action: #selector(passwordToggleTapped))
            passwordContentView.addGestureRecognizer(passwordTapGesture)
            
            passwordRightView.addSubview(passwordContentView)
            password1.rightView = passwordRightView
            password1.rightViewMode = .always
            password1.isSecureTextEntry = true
        }
    func setupConfirmPasswordTextField() {
            let confirmPasswordRightView = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 24))
            let confirmPasswordContentView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 24))
            
            confirmPasswordToggleImageView = UIImageView(image: UIImage(named: "closedeye"))
            confirmPasswordToggleImageView.contentMode = .scaleAspectFit
            confirmPasswordToggleImageView.frame = CGRect(x: 6, y: 0, width: 24, height: 24)
            confirmPasswordContentView.addSubview(confirmPasswordToggleImageView)
            
            let confirmPasswordTapGesture = UITapGestureRecognizer(target: self, action: #selector(confirmPasswordToggleTapped))
            confirmPasswordContentView.addGestureRecognizer(confirmPasswordTapGesture)
            
            confirmPasswordRightView.addSubview(confirmPasswordContentView)
            confirmPassword.rightView = confirmPasswordRightView
            confirmPassword.rightViewMode = .always
            confirmPassword.isSecureTextEntry = true
        }
    
    @objc func passwordToggleTapped() {
            password1.isSecureTextEntry.toggle()
            let imageName = password1.isSecureTextEntry ? "closedeye" : "openeye"
            passwordToggleImageView.image = UIImage(named: imageName)
        }
        
        @objc func confirmPasswordToggleTapped() {
            confirmPassword.isSecureTextEntry.toggle()
            let imageName = confirmPassword.isSecureTextEntry ? "closedeye" : "openeye"
            confirmPasswordToggleImageView.image = UIImage(named: imageName)
        }
    
    @objc func registerButtonTapped(_ sender: UIButton) {
              validateFields()
          }
          func validateFields() {
              view.endEditing(true)
          
           var errorMessages: [UITextField: String] = [:]
          
              guard let username = userName1.text,
                    let emailAddress = email.text,
                    let password = password1.text,
                    let confirm = confirmPassword.text else {
                        return
              }
             if username.isEmpty {
                 errorMessages[userName1] = "*Please enter a username."
             }
             
             if emailAddress.isEmpty {
                 errorMessages[email] = "*Please enter an email address."
             } else if !isValidEmail(emailAddress) {
                 errorMessages[email] = "*Please enter a valid email address."
             }
             
             if password.isEmpty {
                 errorMessages[password1] = "*Please enter a password."
             } else if !isValidPassword(password) {
                 showAlert(withTitle: "Error", message: "Please enter a valid password (Password must have at least 8 characters including at least one uppercase letter, at least one lowercase letter, at least one number and at least one special character).")
                 return
             }
             
             if confirm.isEmpty {
                 errorMessages[confirmPassword] = "*Please confirm your password."
             } else if password != confirm {
                 errorMessages[confirmPassword] = "*Passwords don't match."
             }
             
             if errorMessages.isEmpty {
                 clearErrorMessages()
                 signUp()
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

                   errorLabels.append(errorLabel)
               }
           }
       }
       func clearErrorMessages() {
           for errorLabel in errorLabels {
               errorLabel.removeFromSuperview()
           }
           errorLabels.removeAll()
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
    
    
    @IBAction func RolvaSignUp(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC

        if let password = password1.text, let email = email.text {
            Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
                if  error != nil {
                    print(error!.localizedDescription)
                }
                else {
                    //go to home screen
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
          
//      @IBAction func linkClick(_ sender: Any) {
//          
//          let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//          
//          self.navigationController?.pushViewController(vc, animated: true)
//          
//          guard let email = email.text else { return }
//          guard let password = password1.text else { return }
//
//          
//                    Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
//                        if error != nil {
//                            print("error")
////                            print(error?.localizedDescription)
//                        }
//                        else {
//                            //go to home screen
//                            self.performSegue(withIdentifier: "ViewAllVC", sender: self)
//                        }
//                    }
//      }
    
    func showSuccessModal() {
            let successModalVC = SuccessModalVC()
            successModalVC.modalPresentationStyle = .overFullScreen
            self.present(successModalVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                       successModalVC.dismiss(animated: true, completion: nil)
                   }
        }
    
}
extension UIColor {
    static var darkGreen: UIColor {
        return UIColor(red: 164/255, green: 191/255, blue: 139/255, alpha: 1.0)
    }
}










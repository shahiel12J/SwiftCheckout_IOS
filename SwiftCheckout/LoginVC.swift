//
//  LoginVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 154 on 2023/06/13.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    
    var iconClick = false
    let imageIcon = UIImageView()
    var IsLoggedIn = false
    
    private var errorLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(IsLoggedIn, forKey: "isLogged")
        imageIcon.image = UIImage(named: "closedeye")
                        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 24))
                        let imageViewWidth = imageIcon.image?.size.width ?? 0
                        let imageViewHeight = imageIcon.image?.size.height ?? 0
                        let scaleFactor = min(18 / imageViewWidth, 24 / imageViewHeight)
                        let scaledWidth = imageViewWidth * scaleFactor
                        let scaledHeight = imageViewHeight * scaleFactor
                        let paddingX = (30 - scaledWidth) / 2
                        let paddingY = (24 - scaledHeight) / 2
                        imageIcon.frame = CGRect(x: paddingX, y: paddingY, width: scaledWidth, height: scaledHeight)
                        contentView.addSubview(imageIcon)

                        password.rightView = contentView
                        password.rightViewMode = .always
                        password.isSecureTextEntry = true
                        
                        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                        imageIcon.isUserInteractionEnabled = true
                        imageIcon.addGestureRecognizer(tapGestureRecognizer)
        
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
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if let tappedImageView = tapGestureRecognizer.view as? UIImageView {
            password.isSecureTextEntry.toggle()
            tappedImageView.image = password.isSecureTextEntry ? UIImage(named: "closedeye") : UIImage(named: "openeye")
        }
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
            //login()
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
    
    func login(withEmail email: String, password: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewAllVC") as! ViewAllVC
    
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    // Handle login error
                    print("Login error: (error.localizedDescription)")
                    let alert = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                DispatchQueue.main.async {
                                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                                }
                    return
                }

                // Login successful
                guard let user = result?.user else {
                    print("Failed to get user after login")
                    return
                }

                // User is logged in successfully
                print("Logged in user: (user.uid)")
                //IsLoggedIn = true
                //UserDefaults.standard.set(IsLoggedIn, forKey: "LoggedIn")
                self.navigationController?.pushViewController(vc, animated: true)
                // Perform additional tasks after successful login
            }
    }
    
    func showSuccessModal() {
            let successModalVC = SuccessModalVC()
            successModalVC.modalPresentationStyle = .overFullScreen
            self.present(successModalVC, animated: true, completion: nil)
        }
    
    @IBAction func btnLoginIn(_ sender: Any) {
        login(withEmail: userName.text ?? "default", password: password.text ?? "default" )
        IsLoggedIn = true
        UserDefaults.standard.set(IsLoggedIn, forKey: "isLogged")
        
    }

}


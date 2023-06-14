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
        
//        self.modalPresentationStyle = .fullScreen
//        
//        let LoginVC = LoginVC()
//        self.present(LoginVC, animated: true, completion: nil)
//        
//        self.dismiss(animated: true, completion: nil)

    }

}


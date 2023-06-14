//
//  LoginVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 154 on 2023/06/13.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView()
        myView.backgroundColor = UIColor.darkGreen
        
        textField5.layer.borderColor = UIColor.darkGreen.cgColor
        
        textField5.layer.borderWidth = 1.0
        textField5.layer.cornerRadius = 18.0
        
        textField6.layer.borderColor = UIColor.darkGreen.cgColor
        
        textField6.layer.borderWidth = 1.0
        textField6.layer.cornerRadius = 18.0
        
        LoginBtn.layer.borderWidth = 1.0
        LoginBtn.layer.cornerRadius = 18.0
        LoginBtn.layer.borderColor = UIColor.darkGreen.cgColor
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        

        textField5.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField5.frame.height))
        textField5.leftViewMode = .always
        textField6.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField6.frame.height))
        textField6.leftViewMode = .always
        
//        self.modalPresentationStyle = .fullScreen
//        
//        let LoginVC = LoginVC()
//        self.present(LoginVC, animated: true, completion: nil)
//        
//        self.dismiss(animated: true, completion: nil)

    }

}


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










//
//  SignUpVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 154 on 2023/06/13.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let myView = UIView()
        myView.backgroundColor = UIColor.darkGreen
        
        
        textField.layer.borderColor = UIColor.darkGreen.cgColor
        
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 18.0
        
        textField2.layer.borderColor = UIColor.darkGreen.cgColor
        
        textField2.layer.borderWidth = 1.0
        textField2.layer.cornerRadius = 18.0
        
        textField3.layer.borderColor = UIColor.darkGreen.cgColor
        
        textField3.layer.borderWidth = 1.0
        textField3.layer.cornerRadius = 18.0
        
        textField4.layer.borderColor = UIColor.darkGreen.cgColor
        
        textField4.layer.borderWidth = 1.0
        textField4.layer.cornerRadius = 18.0
        
        SignUpBtn.layer.borderWidth = 1.0
        SignUpBtn.layer.cornerRadius = 18.0
        SignUpBtn.layer.borderColor = UIColor.darkGreen.cgColor
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        
        textField2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField2.frame.height))
        textField2.leftViewMode = .always
        
        textField3.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField3.frame.height))
        textField3.leftViewMode = .always
        
        textField4.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField4.frame.height))
        textField4.leftViewMode = .always
        
        

        
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









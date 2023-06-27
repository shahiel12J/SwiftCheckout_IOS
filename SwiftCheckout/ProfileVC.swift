//
//  ProfileVC.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/22.
//


import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    var IsLoggedIn = (UserDefaults.standard.bool(forKey: "isLogged"))
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutBtn.isHidden = false
        if ((UserDefaults.standard.bool(forKey: "isLogged")) == true){
            
            
            if let currentUser = Auth.auth().currentUser{
                let displayName = currentUser.displayName
                let email = currentUser.email
                
                nameLabel.text = displayName
                emailLabel?.text = email
                
                nameLabel.text = displayName
                emailLabel?.text = email
                
                print("User Display Name: \(displayName ?? "")")
                print("User email: \(email ?? "")")
            }
                
                
            //            IsLoggedIn = false
            //            UserDefaults.standard.set(IsLoggedIn, forKey: "isLogged")
            logoutBtn.isHidden = false
            loginBtn.isHidden = true
        }else{
            logoutBtn.isHidden = true
            loginBtn.isHidden = false
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutClick(_ sender: Any) {
        if ((UserDefaults.standard.bool(forKey: "isLogged")) == true){
                IsLoggedIn = false
                UserDefaults.standard.set(IsLoggedIn, forKey: "isLogged")
                logoutBtn.isHidden = false
                loginBtn.isHidden = true
            }else{
                logoutBtn.isHidden = true
                loginBtn.isHidden = false
                let appDomain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
                UserDefaults.standard.synchronize()
            }
            
            
        }
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }


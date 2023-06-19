//
//  EditProfileViewController.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 137 on 2023/06/19.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    // Mark : Outlets
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    //Mark : Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      /*
        firstnameTextField.text = fname
        lastnameTextfield.text = lastname
        emailTextfield.text = emailaddress
       */
    }
    

    @IBAction func SaveButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
    }
}

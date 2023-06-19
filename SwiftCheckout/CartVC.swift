//
//  CartVC.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/15.
//

import UIKit

class CartVC: UIViewController {
    @IBOutlet weak var testimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var myInstance = cartViewModel(cart: [])
        guard let array: [Any] = UserDefaults.standard.array(forKey: "cart") else {return}

        print(array[0])
  
    }
    
}

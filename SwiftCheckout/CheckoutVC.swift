//
//  CheckoutVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 133 on 2023/06/22.
//

import UIKit

class CheckoutVC: UIViewController {
    
    @IBOutlet weak var cartImg: UIImageView!
    @IBOutlet weak var thankLbl: UILabel!
    @IBOutlet weak var orderLbl: UILabel!
    @IBOutlet weak var browseBtn: UIButton!
    
    var cThank = "Thanks for your order!"
    var cOrder = "Order is being prepared"
    var cImage = #imageLiteral(resourceName: "checkoutCart")
    var IsLoggedIn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        thankLbl.text = cThank
        orderLbl.text = cOrder
        cartImg.image = cImage

    }
    
    @IBAction func btnCheckout(_ sender: Any) {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
        IsLoggedIn = true
        UserDefaults.standard.set(IsLoggedIn, forKey: "isLogged")
    }
}

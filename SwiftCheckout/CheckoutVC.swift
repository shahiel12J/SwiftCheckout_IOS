//
//  CheckoutVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 133 on 2023/06/15.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        thankLbl.text = cThank
        orderLbl.text = cOrder
        cartImg.image = cImage

    }
    
    @IBAction func btnCheckout(_ sender: Any) {
        
    }
}

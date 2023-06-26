//
//  OrderSummaryVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 133 on 2023/06/26.
//

import UIKit
import Foundation
import Firebase

class OrderSummaryVC: UIViewController {
    
    @IBOutlet weak var orderSummLbl: UILabel!
    @IBOutlet weak var pickup: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tAmountLbl: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var collectionTime: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    var orderLbl = "Order summary"
    var opickup = "Address"
    var oAddress = "The Media Mill, 7 Quince St, Auckland Park, Johannesburg, 2000"
    var oTime = "Time"
    var totLbl = "Total:"
    var amountLbl = "R678"
    var oImage = #imageLiteral(resourceName: "grocer")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        let formattedDate = dateFormatter.string(from: currentDate)
        if ((UserDefaults.standard.bool(forKey: "isLogged")) == true){
            if let currentUser = Auth.auth().currentUser{
                
                let displayName = currentUser.displayName
                
                nameLbl?.text = displayName
                
                print("User Display Name: (displayName ?? ",")")
                
                orderSummLbl.text = orderLbl
                pickup.text = opickup
                time.text = oTime
                collectionTime.text = formattedDate
                pickup.text = opickup
                addressLbl.text = oAddress
                totalLbl.text = totLbl
                imgView.image = oImage
                tAmountLbl.text = amountLbl
            }
        }
    }
}

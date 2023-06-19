//
//  HelpVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 133 on 2023/06/19.
//

import UIKit

class HelpVC: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var message: UILabel!
    
    var hMessage = "Please email support@swiftcheckout.com for further assistance"
    var hImage = #imageLiteral(resourceName: "help")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        message.text = hMessage
        imgView.image = hImage

    }

}

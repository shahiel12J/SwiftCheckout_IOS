//
//  DetailsVC.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/05.
//
import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var proPrice: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var proDes: UILabel!
    @IBOutlet weak var proName: UILabel!
    @IBOutlet weak var imgBackground: UIView!
    @IBOutlet weak var SubView: UIView!
    
    var iconShake = CABasicAnimation()
   
    var count = 0
    
    var pName = ""
    var pDescription = ""
    var pPrice: Int = 0
    var pImage = #imageLiteral(resourceName: "krush")
    override func viewDidLoad() {
        super.viewDidLoad()

        SubView.layer.cornerRadius = 25
        imgBackground.layer.cornerRadius = 25
        countLabel.text = String(UserDefaults.standard.integer(forKey: "cartCount") )
        proName.text = pName
        //navigationItem.title = pName
        //navigationItem.backBarButtonItem.
        proDes.text = pDescription
        proPrice.text = "R" + String(pPrice)
        imgView.image = pImage
        
    }
    
    private func navConfig(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
           // barButtonSystemItem: ., target: <#T##Any?#>, action: <#T##Selector?#>
        )
    }
    
    @IBAction func btnAddToCart(_ sender: Any) {
        
        count = UserDefaults.standard.integer(forKey: "cartCount") + 1
        countLabel.text = String(count)
        UserDefaults.standard.set(count, forKey: "cartCount")
        
        iconShake = CABasicAnimation(keyPath: "transform.rotation.z")
        iconShake.fromValue = -0.2
        iconShake.toValue = 0.2
        iconShake.autoreverses = true
        iconShake.duration = 0.2
        iconShake.repeatCount = 1
        imgView.layer.add(iconShake, forKey: "iconShakeAnimation")
    }
    
}

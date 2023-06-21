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
    @IBOutlet weak var quantityDec: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityInc: UIButton!

    var cart: [Any] = []
    
    var iconShake = CABasicAnimation()
    var count = 0
    var quantity = 1
    var pName: String = ""
    var pDescription = ""
    var pPrice: Int = 0
    var pImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SubView.layer.cornerRadius = 25
        imgBackground.layer.cornerRadius = 25
        countLabel.text = String((UserDefaults.standard.array(forKey: "cart") as? [[String]])?.count ?? 0)
        proName.text = pName
        //navigationItem.title = pName
        //navigationItem.backBarButtonItem.
        proDes.text = pDescription
        proPrice.text = "R" + String(pPrice)
        imgView.image = UIImage(named: pImage) 
        navConfig()

    }
    
    private func navConfig(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "cart.fill"),
                style: .done,
                target: self,
                action: nil
        )
 
    }
    
    @IBAction func incQuantity(_ sender: Any) {
        if (quantity < 10){
            quantity = quantity + 1
            quantityLabel.text = String(quantity)
            proPrice.text = "R" + String(pPrice * quantity)
        }
        
    }
    
    @IBAction func decQuantity(_ sender: Any) {
        if (quantity > 1){
            quantity = quantity - 1
            quantityLabel.text = String(quantity)
            proPrice.text = "R" + String(pPrice * quantity)
        }
    }
    
    @IBAction func btnAddToCart(_ sender: Any) {
        
        count = UserDefaults.standard.integer(forKey: "cartCount") + 1
        //countLabel.text = String(count)
        UserDefaults.standard.set(count, forKey: "cartCount")
        countLabel.text = String((UserDefaults.standard.array(forKey: "cart") as? [[String]])?.count ?? 0)
        
        
        iconShake = CABasicAnimation(keyPath: "transform.rotation.z")
        iconShake.fromValue = -0.2
        iconShake.toValue = 0.2
        iconShake.autoreverses = true
        iconShake.duration = 0.2
        iconShake.repeatCount = 1
        imgView.layer.add(iconShake, forKey: "iconShakeAnimation")
        
        var myInstance = cartViewModel()

        myInstance.addToCart(imageURl: pImage, name: pName, quantity: quantity, price: pPrice)
//
//        let new = [pImage, pName, quantity] as [Any]
//        cart.append(new)
//        print(cart)
    }
    
}

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
    var nameCheck:Bool = false
    var iconShake = CABasicAnimation()
    var count = 0
    var quantity = 1
    var pName: String = ""
    var pDescription = ""
    var pPrice: Int = 0
    var pImage = ""
    var cartArray: [[String]] = (UserDefaults.standard.array(forKey: "cart") as? [[String]] ?? [["default"]])

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
        
        cartArray = (UserDefaults.standard.array(forKey: "cart") as? [[String]] ?? [["default"]])
        
        for (rowIndex, row) in cartArray.enumerated(){
            for (columnIndex, value) in row.enumerated(){
                if (value == pName){
                    
                        showAlert()
                        cartArray[rowIndex][2] = String(quantity)
                        UserDefaults.standard.set(cartArray, forKey: "cart")
                        nameCheck = true
                    
                }
            }
        }
        
        if (nameCheck == false){
            myInstance.addToCart(imageURl: pImage, name: pName, quantity: quantity, price: pPrice)
        }else{
            print("go away")
        }

    }
    func showAlert2() {
        let alertController = UIAlertController(title: "Item In Cart", message: "Item already in cart. Try changing the quantity", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        
        alertController.addAction(okAction)
        
        // Present the alert
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Updated", message: "Quantity updated", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        
        alertController.addAction(okAction)
        
        // Present the alert
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}

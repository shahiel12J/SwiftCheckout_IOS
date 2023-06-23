//
//  CartVC.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/15.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var checkout: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var cartArray: [[String]] = (UserDefaults.standard.array(forKey: "cart") as? [[String]] ?? [["default"]])
    var numItems: Int = 0
    var sum = 0
    var p:[Int] = []
    var price:Int = 0
    var quantity = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.leftBarButtonItem = editButtonItem
        numItems = cartArray.count
        checkout.isEnabled = false
        collectionView.reloadData()
    }
    
    @IBAction func btnCheckout(_ sender: UIButton) {
        print((UserDefaults.standard.bool(forKey: "isLogged")))
        if((UserDefaults.standard.bool(forKey: "isLogged")) == false){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CheckoutVC") as! CheckoutVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }

}

extension CartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numItems
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if let indexPaths = collectionView?.indexPathsForVisibleItems{
            for indexPath in indexPaths {
                if let cell = collectionView?.cellForItem(at: indexPath) as? CartViewCell{
                    cell.isEditing = editing
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CartViewCell else {return UICollectionViewCell()}
        print(numItems)
        if (cartArray == [["default"]]){
            price = 0
            quantity = 0
            cell.proImage.isHidden = true
            cell.proName.text = "Cart is empty"
            cell.proQuan.isHidden = true
            cell.proPrice.text = ""
            cell.removeBtn.isHidden = true
            cell.increaseBtn.isHidden = true
            cell.decreaseBtn.isHidden = true
            totalPrice.isHidden = true
            checkout.isHidden = true
        }else if(numItems == 0){
            price = 0
            quantity = 0
            cell.proImage.isHidden = true
            cell.proName.text = "Cart is empty"
            cell.proQuan.isHidden = true
            cell.proPrice.text = ""
            cell.removeBtn.isHidden = true
            cell.increaseBtn.isHidden = true
            cell.decreaseBtn.isHidden = true
            totalPrice.isHidden = true
            checkout.isHidden = true
        }else{
            print(p)
            price = (Int(cartArray[indexPath.item][3]) ?? 0) * (Int(cartArray[indexPath.row][2]) ?? 0)
            
            p.append(price)
            
            sum = 0
            for i in (p){
                sum += i
            }
        
            totalPrice.text = "R" + String(sum)
            
            quantity = Int(cartArray[indexPath.row][2]) ?? 0
            
            cell.proImage.image = UIImage(named: cartArray[indexPath.row][0])
            cell.proName.text = cartArray[indexPath.row][1]
            cell.proQuan.text = String(quantity)
            cell.delegate = self
            cell.proPrice.text = "R" + String(price)
            checkout.isEnabled = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return  CGSize(width: 110, height: 110)
    }

    
}

extension CartVC: CartViewCellDelegate{
    func delete(cell: CartViewCell) {
        if let indexPath = collectionView?.indexPath(for: cell){
            numItems -= 1
            cartArray.remove(at: indexPath.item)
            totalPrice.text = String(0)
            collectionView.reloadData()
            p = []
//            if (numItems == 1){
//                numItems = 0
//                cartArray.remove(at: indexPath.item)
//                totalPrice.text = String(0)
//                collectionView.reloadData()
//            }
        }
        UserDefaults.standard.set(cartArray, forKey: "cart")
        cartArray = (UserDefaults.standard.array(forKey: "cart") as? [[String]])!
    }
}

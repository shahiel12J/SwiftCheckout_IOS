//
//  CartVC.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/15.
//

import UIKit

class CartVC: UIViewController {

    var cartArray: [[String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //var myInstance = cartViewModel()

        cartArray = (UserDefaults.standard.array(forKey: "cart") as? [[String]])!

       // testimage.image = UIImage(named: <#T##String#>)
        //testLabel.text = array[0]
        //proImage.image = UIImage(named: array[0][0])
        //let name = array[0][1]
        //proName.text = array[0][1]
        //proQuan.text = array[0][2]
        print(cartArray[0][1])
      
    }
    

}
extension CartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CartViewCell else {return UICollectionViewCell()}
        
//        cell.backgroundColor = UIColor.white
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.shadowOpacity = 2
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
//        cell.layer.shadowRadius = 4
        
        cell.proImage.image = UIImage(named: cartArray[indexPath.row][0])
        cell.proName.text = cartArray[indexPath.row][1]
        cell.proQuan.text = cartArray[indexPath.row][2]
        
        cell.removeBtn.layer.setValue(indexPath.row, forKey: "index")
        cell.removeBtn.addTarget(self, action: Selector("deleteUser"), for: UIControl.Event.touchUpInside)
            
            

        //print(cartArray[0][1])
        //cell.catImage.image = UIImage(named: String(categories[indexPath.row][1]))
         return cell
        
        }
    
    func deleteUser(sender:UIButton) {

        let i : Int = (sender.layer.value(forKey: "index")) as! Int
        cartArray.remove(at: i)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return  CGSize(width: 110, height: 110)

    }

    
}

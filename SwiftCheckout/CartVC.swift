//
//  CartVC.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/15.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var cartArray: [[String]] = (UserDefaults.standard.array(forKey: "cart") as? [[String]])!
    var numItems: Int = 0
    var sum = 0
    var p:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //var myInstance = cartViewModel()
        //navigationItem.leftBarButtonItem = editButtonItem
        numItems = cartArray.count
        //cartArray = (UserDefaults.standard.array(forKey: "cart") as? [[String]])!
        //print(cartArray)
      
    }
    
    @IBAction func btnCheckout(_ sender: UIButton) {
        performSegue(withIdentifier: "checkout", sender: nil)
    }

}

extension CartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //print(numItems)
        return numItems
    }
    
//    func deleteUser(sender:UIButton) {
//
//        let i : Int = (sender.layer.value(forKey: "index")) as! Int
//        cartArray.remove(at: i)
//        collectionView.reloadData()
//    }
//
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
        
//        cell.backgroundColor = UIColor.white
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.shadowOpacity = 2
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
//        cell.layer.shadowRadius = 4
        let price =  (Int(cartArray[indexPath.item][3]) ?? 0) * (Int(cartArray[indexPath.row][2]) ?? 0)
        p.append(price)
        print(p)
        sum = 0
        for i in (p){
            sum += i
            print(sum)
        }
        totalPrice.text = "R" + String(sum)
//        for (index, i) in (p).enumerated() {
//            if index % 2 == 0 {
//                // Skip the even-indexed item
//                continue
//            }
//            sum += Int(cartArray[indexPath.item][3]) ?? 0
//            // Process the odd-indexed item
//            print(p)
//        }
        
        cell.proImage.image = UIImage(named: cartArray[indexPath.row][0])
        cell.proName.text = cartArray[indexPath.row][1]
        cell.proQuan.text = cartArray[indexPath.row][2]
        cell.delegate = self
        cell.proPrice.text = "R" + String(price)
//        cell.removeBtn.layer.setValue(indexPath.row, forKey: "index")
//        cell.removeBtn.addTarget(self, action: Selector(("deleteUser")), for: UIControl.Event.touchUpInside)
            
            

        //print(cartArray[0][1])
        //cell.catImage.image = UIImage(named: String(categories[indexPath.row][1]))
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
            collectionView.reloadData()
            cartArray.remove(at: indexPath.item)
            //cartArray[indexPath.section].remove(at: indexPath.item)
           
            //cartArray[indexPath.section].remove(at: indexPath.item)
            //collectionView?.deleteItems(at: [indexPath])

        }
        UserDefaults.standard.set(cartArray, forKey: "cart")
        cartArray = (UserDefaults.standard.array(forKey: "cart") as? [[String]])!
    }
}

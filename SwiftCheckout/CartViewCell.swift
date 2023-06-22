//
//  CartViewCell.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/19.
//

import UIKit

protocol CartViewCellDelegate: AnyObject {
    func delete(cell:CartViewCell)
}

class CartViewCell: UICollectionViewCell {
    
    @IBOutlet weak var decreaseBtn: UIButton!
    @IBOutlet weak var increaseBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var proQuan: UILabel!
    @IBOutlet weak var proName: UILabel!
    @IBOutlet weak var proImage: UIImageView!
    @IBOutlet weak var proPrice: UILabel!
    @IBOutlet weak var cartCell: UIView!
    
    weak var delegate: CartViewCellDelegate?
    var oldQuan: String = ""
    var newQuan: Int = 0
    
    override func awakeFromNib() {
           super.awakeFromNib()
           setupCellAppearance()
       }
    
       
       private func setupCellAppearance() {
           cartCell.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
           //layer.cornerRadius = 8
           layer.shadowColor = UIColor.black.cgColor
           layer.shadowOpacity = 0.5
           layer.shadowOffset = CGSize(width: 2, height: 4)
           //layer.shadowRadius = 4
           layer.masksToBounds = false
           layer.shouldRasterize = true
           layer.rasterizationScale = UIScreen.main.scale
       }
    
    var select:String! {
        didSet{
            removeBtn.isHidden = !isEditing
        }
    }
    
    var isEditing: Bool = false{
        didSet{
            removeBtn.isHidden = !isEditing
        }
    }
    
    @IBAction func deleteSelect(_ sender: Any) {
        delegate?.delete(cell: self)
    }

    @IBAction func increaseQuan(_ sender: Any) {
        oldQuan = proQuan.text ?? "0"
        newQuan = (Int(oldQuan) ?? 0) + 1
        print(newQuan)
        proQuan.text = String(newQuan)
    }
    
    @IBAction func decreaseQuan(_ sender: Any) {
        oldQuan = proQuan.text ?? "0"
        newQuan = (Int(oldQuan) ?? 0) - 1
        print(newQuan)
        proQuan.text = String(newQuan)
    }
    
    func returnQuan() -> Int{
        return newQuan
    }
}

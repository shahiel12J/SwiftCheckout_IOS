//
//  CartViewCell.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/19.
//

import UIKit

protocol CartViewCellDelegate: class {
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
    
    weak var delegate: CartViewCellDelegate?
    var oldQuan: String = ""
    var newQuan: Int = 0
    
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

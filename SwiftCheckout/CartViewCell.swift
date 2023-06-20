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
    
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var proQuan: UILabel!
    @IBOutlet weak var proName: UILabel!
    @IBOutlet weak var proImage: UIImageView!
    
    weak var delegate: CartViewCellDelegate?
    
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
    
}

//
//  cartViewModel.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/15.
//

import Foundation
import UIKit

struct cartViewModel {
    
    var cart: [Any]
    
    mutating func addToCart(imageURl: String, name:String, quantity: Int){
        let new = [imageURl, name, quantity] as [Any]
        cart.append(new)
        UserDefaults.standard.set(cart, forKey: "cart")
        //print(cart)
    }
    
    func show(){
        print(cart)
    }
}

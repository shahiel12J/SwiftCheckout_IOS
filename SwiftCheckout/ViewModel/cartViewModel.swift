//
//  cartViewModel.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/15.
//

import Foundation
import UIKit

struct cartViewModel {
    
    //let cart: Cart
    
    //var cart: [Any]
    //let defaults = UserDefaults.standard
    
//    func cartArray(){
//        defaults.set(cart, forKey: "cart")
//    }
    
    mutating func addToCart(imageURl: String, name:String, quantity: Int){
        let new = [imageURl, name, String(quantity)]
        
        if var cart = UserDefaults.standard.array(forKey: "cart")  as? [[String]] {
  
            cart.append(new)
            
          
            UserDefaults.standard.set(cart, forKey: "cart")
        } else {
            
            let newArray: [[String]] = []
            
            UserDefaults.standard.set(newArray, forKey: "cart")
            
            print(newArray)
        }
        
        //cart.append(contentsOf: new)
       // defaults.synchronize()
        //UserDefaults.standard.set(cart, forKey: "cart")
    }
    
    
}


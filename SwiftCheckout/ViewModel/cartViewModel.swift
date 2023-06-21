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
    
    mutating func addToCart(imageURl: String, name:String, quantity: Int, price: Int){
        
        let new = [imageURl, name, String(quantity), String(price)]
        
        if var cart = UserDefaults.standard.array(forKey: "cart")  as? [[String]] {
//            print(new)
//            for i in (cart){
//                print(i)
//                for j in i {
//                    print(j)
//                    print(name)
//                    if (j == name){
//                        print(j)
//                    }else{
//                        cart.append(new)
//                    }
//                }
//            }
            cart.append(new)
            
            
            
          
            UserDefaults.standard.set(cart, forKey: "cart")
        } else {
            
            var newArray: [[String]] = []
            
            UserDefaults.standard.set(newArray, forKey: "cart")
            //print(new)
            //newArray.append(new)
            //print(newArray)
        }
        
        //cart.append(contentsOf: new)
       // defaults.synchronize()
        //UserDefaults.standard.set(cart, forKey: "cart")
    }
    
    
}


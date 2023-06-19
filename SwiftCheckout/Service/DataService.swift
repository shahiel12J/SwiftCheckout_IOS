//
//  DataService.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/08.
//

import Foundation

struct webService{
    
    func getArticles(url:URL, completion: @escaping ([Product]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                //print(data)
                
                let data = try? JSONDecoder().decode(Products.self, from: data).data
                
                if let data = data{
                    //print(data)
                    completion(data)
                    
                }
              
            }
        }.resume()
    }
    
//    func getCart(url:URL, completion: @escaping (Cart) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                //completion(nil)
//            }else if let data = data {
//                //print(data)
//                
//                let cart = try? JSONDecoder().decode(Cart.self, from: data)
//                
//                if let data = cart{
//                    //print(data)
//                    completion(data)
//                    
//                }
//              
//            }
//        }.resume()
//    }
}

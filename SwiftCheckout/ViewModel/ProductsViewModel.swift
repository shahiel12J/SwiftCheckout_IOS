//
//  ProductsViewModel.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/07.
//

import Foundation

struct ProductsViewModel {
    
    let product: [Product]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        return product.count
    }
    
    func productsAtIndex(_ index: Int) -> ProductViewModel {
        let product = self.product[index]
        return ProductViewModel(product)
    }
    
}

struct ProductViewModel {
    private let product: Product
    
    
    init(_ product: Product){
        self.product = product
    }
}
extension ProductViewModel {
    var name: String{
        return self.product.name
    }
    
    var price: Double{
        return self.product.price
    }
    
    var description: String{
        return self.product.description
    }
    
    var category: Category{
        return self.product.category
    }
    
    var image: Image{
        return self.product.image
    }
}



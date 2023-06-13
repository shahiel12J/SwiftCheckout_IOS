//
//  Products.swift
//  SwiftCheckout
//
//  Created by DA MAC M1 126 on 2023/06/06.
//

import Foundation

// MARK: - Products
struct Products: Codable {
    //let products: [Products]
    let data: [Product]
    let message: String
    let status: Int
}

// MARK: - Datum
struct Product: Codable {
    let productID: Int
    let name: String
    let price: Double
    let description: String
    let category: Category
    let image: Image

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name, price, description, category, image
    }
}

// MARK: - Category
struct Category: Codable {
    let categoryID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case name
    }
}

// MARK: - Image
struct Image: Codable {
    let imageID: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageID = "imageId"
        case imageURL
    }
}


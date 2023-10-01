//
//  Product.swift
//  yemeksepeti2
//
//  Created by Büşra Özcan on 1.10.2023.
//
import Foundation


class Product {
    var name:String?
    var price:String?
    var category:String?
    var image:String?
    
    init(name: String? = nil, price: String? = nil, category: String? = nil, image: String? = nil) {
        self.name = name
        self.price = price
        self.category = category
        self.image = image
    }
}


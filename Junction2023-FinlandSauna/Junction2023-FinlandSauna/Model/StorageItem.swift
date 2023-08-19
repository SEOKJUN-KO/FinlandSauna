//
//  StorageItem.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import Foundation

struct StorageItem: Codable, Identifiable {
    var id: UUID
    var name: String
    var brand: String
    var itemType: String
    var serving: Double
    var amount: Int
    var position: String
    var tag: Int
    var image: String
    
    init(id: UUID, name: String, brand: String, itemType: String, serving: Double, amount: Int, position: String, tag: Int, image: String) {
        self.id = id
        self.name = name
        self.brand = brand
        self.itemType = itemType
        self.serving = serving
        self.amount = amount
        self.position = position
        self.tag = tag
        self.image = image
    }
    
    init() {
        self.id = UUID()
        self.name = ""
        self.brand = ""
        self.itemType = ""
        self.serving = 0
        self.amount = 0
        self.position = ""
        self.tag = 1
        self.image = "footShampoo"
    }
}

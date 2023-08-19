//
//  Order.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import Foundation

struct Order: Codable, Identifiable {
    var id: String
    var code: String
    var name: String
    var address: String
    var date: Date
    var amount: Int {
        storageItems.count
    }
    var storageItems: [StorageItem]
    
    init(id: String, code: String, name: String, address: String, date: Date, storageItems: [StorageItem]) {
        self.id = id
        self.code = code
        self.name = name
        self.address = address
        self.date = date
        self.storageItems = storageItems
    }
}

extension Order {
    static let sampleOrders: [Order] = [
        Order(id: "Order287", code: "20230819A287", name: "정승균", address: "부산 해운대구 APEC로 55", date: Date(), storageItems: [
            StorageItem(id: UUID(), name: "พริงเกิลส์", brand: "Nongsim", itemType: "snack", serving: 110, amount: 1, position: "A - 1", tag: 1),
            StorageItem(id: UUID(), name: "เวลช์", brand: "Nongsim", itemType: "drink", serving: 355, amount: 2, position: "B - 2", tag: 2),
            StorageItem(id: UUID(), name: "กระทิงแดง", brand: "Lotte", itemType: "drink", serving: 250, amount: 1, position: "A - 3", tag: 3),
            StorageItem(id: UUID(), name: "โปรตีนบาร์", brand: "Coupang", itemType: "snack", serving: 50, amount: 1, position: "A - 6", tag: 4),
        ]),
        Order(id: "Order288", code: "20230819A288", name: "최민규", address: "부산 해운대구 APEC로 55", date: Date(), storageItems: [StorageItem(), StorageItem(), StorageItem()]),
        Order(id: "Order289", code: "20230819A289", name: "박상원", address: "부산 해운대구 APEC로 55", date: Date(), storageItems: [StorageItem(), StorageItem(), StorageItem(), StorageItem()]),
        Order(id: "Order290", code: "20230819A290", name: "고석준", address: "부산 해운대구 APEC로 55", date: Date(), storageItems: [StorageItem(), StorageItem()]),
        Order(id: "Order291", code: "20230819A291", name: "조호식", address: "부산 해운대구 APEC로 55", date: Date(), storageItems: [StorageItem(), StorageItem(), StorageItem(), StorageItem(), StorageItem(), StorageItem(), StorageItem(), StorageItem()]),
    ]
}

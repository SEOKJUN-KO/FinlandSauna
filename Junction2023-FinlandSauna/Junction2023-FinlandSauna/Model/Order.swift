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
            StorageItem(id: UUID(), name: "บนร่างกาย มาล้างเท้ากันเถอะ", brand: "On the body", itemType: "foot shampoo", serving: 110, amount: 1, position: "A-4", tag: 1, image: "footShampoo"),
            StorageItem(id: UUID(), name: "เดทตอลโฟมล้างมือกลิ่นส้ม", brand: "Dettol", itemType: "hand soap", serving: 355, amount: 2, position: "B-2", tag: 2, image: "hand soap"),
            StorageItem(id: UUID(), name: "CrossAction ทั้งหมดในหนึ่งเดียว", brand: "Oral-B", itemType: "tooth brush", serving: 250, amount: 1, position: "A-2", tag: 3, image: "toothBrush"),
            StorageItem(id: UUID(), name: "Plackers Micro Mint", brand: "Plackers", itemType: "dental floss", serving: 50, amount: 1, position: "B-4", tag: 4, image: "floss"),
            StorageItem(id: UUID(), name: "คลิปผ้าขนหนูชายหาด", brand: "WaaWee", itemType: "tower clips", serving: 50, amount: 1, position: "B-3", tag: 5, image: "clips"),
        ]),
        Order(id: "Order288", code: "20230819A288", name: "최민규", address: "부산 해운대구 APEC로 55", date: Date(), storageItems: [
            StorageItem(id: UUID(), name: "ปากกาลูกลื่นแบบยืดหดได้ของ Amazon Basics", brand: "Amazon", itemType: "Ballpoint Pen", serving: 110, amount: 1, position: "A-1", tag: 1, image: "pen"),
            StorageItem(id: UUID(), name: "Mr. Pen ดินสอ ยางลบ", brand: "Mr. Pen", itemType: "eraser", serving: 140, amount: 1, position: "A-4", tag: 2, image: "eraser"),
            StorageItem(id: UUID(), name: "ตะกั่วซุปเปอร์ไฮโพลิเมอร์®", brand: "Pentel", itemType: "Mechanical Pencil Lead", serving: 50, amount: 1, position: "B-2", tag: 3, image: "lead"),
            StorageItem(id: UUID(), name: "Mintra Office สมุดโน้ตเกลียวทนทาน", brand: "Mintra Office", itemType: "note", serving: 300, amount: 1, position: "B-3", tag: 4, image: "note")
        ]),
        Order(id: "Order289", code: "20230819A289", name: "박상원", address: "부산 해운대구 APEC로 55", date: Date(), storageItems: [
            StorageItem(id: UUID(), name: "C Cell ถ่านอัลคาไลน์อเนกประสงค์", brand: "Amazon", itemType: "Batteries", serving: 30, amount: 1, position: "B-4", tag: 1, image: "battery"),
            StorageItem(id: UUID(), name: "ถ้วยกระดาษ Ripple กาแฟแดง 6 ออนซ์", brand: "SheriffDrink", itemType: "Paper Cup", serving: 70, amount: 1, position: "B-1", tag: 1, image: "cup"),
            StorageItem(id: UUID(), name: "บนร่างกาย มาล้างเท้ากันเถอะ", brand: "On the body", itemType: "foot shampoo", serving: 110, amount: 1, position: "A-4", tag: 1, image: "footShampoo"),
            
        ]),
    ]
}

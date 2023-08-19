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
}

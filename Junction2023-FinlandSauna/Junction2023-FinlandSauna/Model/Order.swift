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
    var amount: Int
}

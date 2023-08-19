//
//  ProcessViewModel.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import Foundation

class ProcessViewModel: ObservableObject {
    @Published var orders: [Order] = Order.sampleOrders
}

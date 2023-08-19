//
//  OrderDetailView.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI

struct OrderDetailView: View {
    let title: String
    let orderItems: [StorageItem]
    
    @AppStorage("myLanguage") var myLanguage: Languages = .en
    @AppStorage("targetLanguage") var targetLanguage: Languages = .th
    
    var body: some View {
        List(orderItems) { item in
            StorageItemRowView(item: item)
        }
        .listStyle(.plain)
        .navigationTitle(title)
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(title: "Order 2222", orderItems: [])
    }
}

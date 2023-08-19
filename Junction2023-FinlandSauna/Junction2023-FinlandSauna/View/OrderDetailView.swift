//
//  OrderDetailView.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI

struct OrderDetailView: View {
    let title: String
    var body: some View {
        List {
            ForEach(0..<5) { _ in
                StorageItemRowView(item: StorageItem(id: UUID(), name: "Surströmming", brand: "Roda Ulven", itemType: "marinated herring", serving: 300, amount: 1, position: "A-1"))
            }
            
        }
        .listStyle(.plain)
        .navigationTitle(title)
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(title: "Order287")
    }
}

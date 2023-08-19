//
//  OrderListView.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI

struct OrderListView: View {
    
    var body: some View {
        List {
            ForEach(0..<4) { _ in
                NavigationLink {
                    OrderDetailView(title: "Order288")
                } label: {
                    OrderRowView(order: Order(id: "Order288", code: "20230819A288", name: "홍길동", address: "부산 해운대구 APEC로 55", date: Date(), amount: 3))
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Today")
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderListView()
        }
    }
}

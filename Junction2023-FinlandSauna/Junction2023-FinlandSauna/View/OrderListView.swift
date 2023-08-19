//
//  OrderListView.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI

struct OrderListView: View {
    @StateObject var process = ProcessViewModel()
    var body: some View {
        List(process.orders) { order in
            NavigationLink {
                OrderDetailView(title: "Order288")
            } label: {
                OrderRowView(order: order)
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

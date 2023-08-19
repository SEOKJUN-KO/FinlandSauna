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
        ZStack {
            VStack(alignment: .leading) {
                Text("Today's Ship Out")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 16)
                
                List(process.orders) { order in
                    NavigationLink {
                        OrderDetailView(title: "Order288")
                    } label: {
                        OrderRowView(order: order)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Logitics")
            }
            
            
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderListView()
        }
    }
}

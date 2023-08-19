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
                        OrderDetailView(title: order.id, orderItems: order.storageItems)
                    } label: {
                        OrderRowView(order: order)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Logitics")
            }
            VStack {
                Spacer()
                NavigationLink {
                    if let firstItem = process.orders.first {
                        OrderDetailView(title: firstItem.id, orderItems: firstItem.storageItems)
                    }
                            
                } label: {
                    Text("Start Process")
                        .foregroundColor(.white)
                        .bold()
                        .font(.body)
                        .padding(.vertical, 19)
                        .frame(maxWidth: .infinity)
                        .background(Color.theme.main001)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 8)
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

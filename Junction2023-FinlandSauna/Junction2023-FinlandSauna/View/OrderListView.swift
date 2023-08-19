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
            List {
                VStack(alignment: .leading) {
                    Text("Today's Ship Out")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 16)
                }
                
                ForEach(process.orders) { order in
                    NavigationLink {
                        OrderDetailView(title: order.id, orderItems: order.storageItems)
                    } label: {
                        OrderRowView(order: order)
                    }
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            
            VStack {
                Spacer()
                NavigationLink {
                    if let firstItem = process.orders.first {
                        ProcessingView(processItems: firstItem.storageItems)
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
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 8)
            }
            .padding(.bottom, 32)
        }
        .navigationTitle("Logistics")
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderListView()
        }
    }
}

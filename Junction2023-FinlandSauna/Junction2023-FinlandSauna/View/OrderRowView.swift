//
//  OrderRowView.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI

struct OrderRowView: View {
    let order: Order
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(order.id)
                        .font(.title2)
                        .bold()
                    Group {
                        Text("code: ") + Text(order.code)
                        Text("name: ") + Text(order.name)
                        Text("address: ") + Text(order.address)
                        Text("date: ") + Text(order.date.description)
                    }
                    .font(.caption)
                }
                
                Spacer()
                
                Text("\(order.amount) EA")
                    .font(.title2)
                    .bold()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 13)
        }
        .background(Color.secondary)
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: Order(id: "Order288", code: "20230819A288", name: "홍길동", address: "부산 해운대구 APEC로 55", date: Date(), amount: 3))
    }
}

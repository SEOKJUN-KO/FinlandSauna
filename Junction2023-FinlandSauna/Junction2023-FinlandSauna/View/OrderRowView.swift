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
        .background(Color.theme.grayGradation005)
        .cornerRadius(20)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: Order.sampleOrders.first!)
    }
}

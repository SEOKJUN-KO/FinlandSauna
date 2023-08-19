//
//  StorageItemRowView.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI

struct StorageItemRowView: View {
    let item: StorageItem
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.title2)
                        .bold()
                    Group {
                        Text("Brand: ") + Text(item.brand)
                        
                        Text("Item: ") + Text(item.itemType)
                        
                        Text("Serving: ") + Text("\(String(format: "%.1f", item.serving))g")
                    }
                    .font(.caption)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(item.amount) EA")
                        .font(.title3)
                        .bold()
                    Text("위치: \(item.position)")
                        .font(.headline)
                        .bold()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 13)
        }
        .background(Color.secondary)
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
}

struct StorageItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        StorageItemRowView(item: StorageItem(id: UUID(), name: "Surströmming", brand: "Roda Ulven", itemType: "marinated herring", serving: 300, amount: 1, position: "A-1"))
    }
}

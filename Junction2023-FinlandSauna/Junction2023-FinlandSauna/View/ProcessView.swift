//
//  ProcessView.swift
//  Junction2023-FinlandSauna
//
//  Created by Ko Seokjun on 2023/08/19.
//

import SwiftUI

struct ProcessView: View {
    var image: Image
    var id: String
    var location: String
    var needNumber: Int
    var rawName: String
    var detail: String
    var brand: String
    var serving: Double
    
    init(image: Image, id: String, location: String, needNumber: Int, rawName: String, detail: String, brand: String, serving: Double) {
        self.image = image
        self.id = id
        self.location = location
        self.needNumber = needNumber
        self.rawName = rawName
        self.detail = detail
        self.brand = brand
        self.serving = serving
    }
    
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray.opacity(0.15))
                .frame(width: 361,height: 350)
            
            VStack{
                HStack{
                    Text(rawName)
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Text("\(needNumber) EA")
                        .font(.system(size: 28, weight: .bold))
                }
                .frame(width: 300)
                .padding(.top, 10)
                Text("Surstromming")
                    .font(.system(size: 22, weight: .bold))
                    .frame(width: 300, alignment: .leading)
                    .padding(.bottom, 8)
                
                Text("Item: "+detail)
                    .font(.system(size: 17, weight: .regular))
                    .frame(width: 300, alignment: .leading)
                Text("Brand: "+brand)
                    .font(.system(size: 17, weight: .regular))
                    .frame(width: 300, alignment: .leading)
                Text("Serving: \(serving, specifier: "%.2f")g")
                    .font(.system(size: 17, weight: .regular))
                    .frame(width: 300, alignment: .leading)
                VStack{
                    image
                        .frame(width: 140, height: 100)
                        .border(.red)
                }.frame(width: 300, alignment: .leading)
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 132, height: 30)
                            .foregroundColor(.gray)
                        Text(id)
                    }
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 80, height: 30)
                            .foregroundColor(.red)
                        Text(location)
                    }
                }
                .frame(width: 300)
            }
            .padding(.top, 16)
        }
    }
}

struct ProcessView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessView(image: Image(systemName: "square.and.arrow.down.fill"), id: "104-834-25", location: "A-1", needNumber: 1, rawName: "Surströmming", detail: "fermented herring fish", brand: "Roda Ulven", serving: 300)
    }
}

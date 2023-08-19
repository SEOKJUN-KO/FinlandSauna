//
//  ProcessingView.swift
//  Junction2023-FinlandSauna
//
//  Created by Ko Seokjun on 2023/08/19.
//

import SwiftUI

struct ProcessingView: View {
    @State var processItems: [StorageItem]
    let array: [[String]] = [["A-1", "A-2", "A-3", "A-4"], ["B-1", "B-2", "B-3", "B-4"]]
    @State private var selected: Bool = false
    @State private var storageIndex: String = "B-3"
    @State private var moveY:CGFloat = 280
    @State var presentSheet = true
    @State var nfc = "emptyNFC"
    @State private var index: Int = 1
    @State private var alarmShow: Bool = false
    @StateObject var beaconManager = BeaconManager()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.grayGradation005
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack(spacing: 89) {
                    ForEach(array, id: \.self) { row in
                        VStack(spacing: 41) {
                            ForEach(row, id: \.self) { item in
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(item == storageIndex ? .blue : .white)
                                    .frame(width: 120, height: 30)
                                    .overlay(
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(lineWidth: 1)
                                            Text(item)
                                                .foregroundColor(.gray.opacity(0.2))
                                                .font(.system(size: 20, weight: .bold))
                                        }
                                    )
                            }
                        }
                    }
                }
                .padding(.top, 53)
                ZStack {
                    Color.white
                    
                    TabView(selection: $index){
                        ForEach(processItems) { item in
                            ProcessView(image: Image(systemName: "square.and.arrow.down.fill"), id: "104-1", location: item.position, needNumber: item.amount, rawName: item.name, detail: item.itemType, brand: item.brand, serving: item.serving)
                                .cornerRadius(20)
                                .tag(item.tag)
                                .onAppear{
                                    storageIndex = item.position
                                    relocateY(relocate: moveY)
                                }
                                .onTapGesture {
                                    if(processItems.count > index){
                                        index += 1
                                        alarmShow = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                            alarmShow = false
                                        }
                                    }
                                    else{
                                        //네비게이션 뒤로 가기
                                    }
                                }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
                
            }
            .onAppear{
                beaconManager.startScanning()
            }
            Image(nfc)
                .resizable()
                .frame(width: 82.58, height: 82.58)
            VStack {
                Circle()
                    .frame(width: 33, height: 33)
                    .foregroundColor(.blue)
                    .offset(x: 0, y: beaconManager.estimatedDistance*32)
                
                Text("RSSIIPAD: \(beaconManager.RSSIIpad)")
                Text("RSSIMAC: \(beaconManager.RSSIMac)")
                Text("RSSIMAC: \(beaconManager.estimatedDistance)")
            }
            
            if( alarmShow ){
                ZStack{
                    Color.black.opacity(0.6)
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150,height: 150)
                        .foregroundColor(.gray)
                    VStack{
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                        Text("Done")
                    }
                }.ignoresSafeArea()
            }
        }
        .onAppear{
            relocateY(relocate: 290)
        }
    }
}

struct ProcessingView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessingView(processItems:
                        [StorageItem(id: UUID(), name: "Z", brand: "E", itemType: "K", serving: 300, amount: 2, position: "B-1", tag: 1),
                         StorageItem(id: UUID(), name: "W", brand: "R", itemType: "Q", serving: 100, amount: 4, position: "B-4", tag: 2)]
        )
    }
}

extension ProcessingView {
    func relocateY(relocate: CGFloat) {
        if(relocate <= 50 || relocate >= 290){
            return
        }
        if( storageIndex.last! == "1"){
            if( 50 <= moveY && moveY <= 70 ){
                nfc = "NFC"
            }
            else{
                nfc = "emptyNFC"
            }
        }
        else if( storageIndex.last! == "2" ){
            if( 120 <= moveY && moveY <= 140 ){
                nfc = "NFC"
            }
            else{
                nfc = "emptyNFC"
            }
        }
        else if( storageIndex.last! == "3" ){
            if( 190 <= moveY && moveY <= 220 ){
                nfc = "NFC"
            }
            else{
                nfc = "emptyNFC"
            }
        }
        else if( storageIndex.last! == "4" ){
            if( 260 <= moveY && moveY <= 280 ){
                nfc = "NFC"
            }
            else{
                nfc = "emptyNFC"
            }
        }
    }
}

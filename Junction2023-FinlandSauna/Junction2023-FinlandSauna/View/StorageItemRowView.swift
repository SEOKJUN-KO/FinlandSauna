//
//  StorageItemRowView.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI
import UIKit
import MLKitTranslate

struct StorageItemRowView: View {
    let item: StorageItem
    @State var translatedName: String = ""
    @State var showingDownloading: Bool = false
    
    @AppStorage("myLanguage") var myLanguage: Languages = .en
    @AppStorage("targetLanguage") var targetLanguage: Languages = .th
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.name)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        Text("\(item.amount) EA")
                            .font(.title3)
                            .bold()
                    }
                    if showingDownloading {
                        ActivityIndicator(animate: .constant(true))
                    } else {
                        Text(translatedName)
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 8)
                    }
                    
                    Group {
                        Text("Brand: ") + Text(item.brand)
                        
                        Text("Item: ") + Text(item.itemType)
                        
                        Text("Serving: ") + Text("\(String(format: "%.1f", item.serving))g")
                    }
                    .font(.caption)
                    
                    HStack {
                        Spacer()
                        
                        Text(item.position)
                            .font(.headline)
                            .bold()
                            .padding(.vertical, 4)
                            .padding(.horizontal, 24)
                            .background(Color.theme.secondary002)
                            .cornerRadius(8)
                        
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 13)
        }
        .background(Color.theme.grayGradation005)
        .cornerRadius(20)
        .padding(.horizontal, 16)
        .onAppear {
            let options = TranslatorOptions(sourceLanguage: targetLanguage.translateLanguage, targetLanguage: myLanguage.translateLanguage)
            let translator = Translator.translator(options: options)
            let conditions = ModelDownloadConditions(allowsCellularAccess: true, allowsBackgroundDownloading: true)
            self.showingDownloading = true
            translator.downloadModelIfNeeded(with: conditions) { error in
                guard error == nil else { return }
                self.showingDownloading = true
                translator.translate(item.name) { translatedText, error in
                    guard error == nil, let translatedText = translatedText else { return }
                    print(translatedText)
                    translatedName = translatedText
                }
                self.showingDownloading = false
            }
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    @Binding var animate: Bool
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

struct StorageItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        StorageItemRowView(item: StorageItem(id: UUID(), name: "Surströmming", brand: "Roda Ulven", itemType: "marinated herring", serving: 300, amount: 1, position: "A-1", tag: 1))
    }
}

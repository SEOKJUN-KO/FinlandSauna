//
//  ProcessView.swift
//  Junction2023-FinlandSauna
//
//  Created by Ko Seokjun on 2023/08/19.
//

import SwiftUI
import MLKitTranslate

struct ProcessView: View {
    var image: String
    var id: String
    var location: String
    var needNumber: Int
    var rawName: String
    var detail: String
    var brand: String
    var serving: Double
    
    @State var translatedName: String = ""
    @State var showingDownloading: Bool = false
    
    @AppStorage("myLanguage") var myLanguage: Languages = .en
    @AppStorage("targetLanguage") var targetLanguage: Languages = .th
    
    init(image: String, id: String, location: String, needNumber: Int, rawName: String, detail: String, brand: String, serving: Double) {
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
                .foregroundColor(.theme.gray006)
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
                .padding(.top, 20)
                if showingDownloading {
                    ActivityIndicator(animate: .constant(true))
                } else {
                    Text(translatedName)
                        .font(.system(size: 22, weight: .bold))
                        .frame(width: 300, alignment: .leading)
                        .padding(.bottom, 8)
                }
                
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
                    Image(image)
                        .resizable()
                        .frame(width: 140, height: 100)
                }.frame(width: 300, alignment: .leading)
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 132, height: 30)
                            .foregroundColor(Color("FS_gray002"))
                        Text(id)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                    }
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 80, height: 30)
                            .foregroundColor(Color("FS_main002"))
                        Text(location)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                    }
                }
                .frame(width: 300)
            }
            .padding(.top, 16)
        }
        .onAppear {
            let options = TranslatorOptions(sourceLanguage: targetLanguage.translateLanguage, targetLanguage: myLanguage.translateLanguage)
            let translator = Translator.translator(options: options)
            let conditions = ModelDownloadConditions(allowsCellularAccess: true, allowsBackgroundDownloading: true)
            self.showingDownloading = true
            translator.downloadModelIfNeeded(with: conditions) { error in
                guard error == nil else { return }
                self.showingDownloading = true
                translator.translate(rawName) { translatedText, error in
                    guard error == nil, let translatedText = translatedText else { return }
                    print(translatedText)
                    translatedName = translatedText
                    
                    NetworkManager().drawTranslate(translatedString: translatedName)
                }
                self.showingDownloading = false
            }
        }
    }
}

struct ProcessView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessView(image: "footShampoo", id: "104-834-25", location: "A-1", needNumber: 1, rawName: "Surströmming", detail: "fermented herring fish", brand: "Roda Ulven", serving: 300)
    }
}

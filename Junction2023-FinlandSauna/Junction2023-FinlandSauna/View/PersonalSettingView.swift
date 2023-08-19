//
//  PersonalSettingView.swift
//  Junction2023-FinlandSauna
//
//  Created by Ko Seokjun on 2023/08/19.
//

import SwiftUI

enum Languages: String, CaseIterable {
    case ko
    case en
    case th
    case vi
    case sv
    
    var contryName: String {
        switch self {
        case .ko:
            return "Korea"
        case .en:
            return "English"
        case .th:
            return "Thailand"
        case .vi:
            return "Vietnam"
        case .sv:
            return "Sweden"
        }
    }
}

struct PersonalSettingView: View {
    @State var fromCountry: Languages = .th
    @State var inCountry: Languages = .en
    let countries: [Languages] = Languages.allCases
    
    @AppStorage("onboarding") var isOnboarindViewActive: Bool = true
    
    @AppStorage("myLanguage") var myLanguage: Languages = .en
    @AppStorage("targetLanguage") var targetLanguage: Languages = .th
    
    var body: some View {
        ZStack(alignment: .top){
            Color(.white)
            VStack {
                Text("You are in")
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 361, alignment: .leading)
                Menu{
                    Picker("Choose a color", selection: $inCountry) {
                        ForEach(countries, id: \.self) {
                            Text($0.contryName)
                        }
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.theme.gray005)
                        HStack{
                            Text(inCountry.contryName)
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 300, alignment: .leading)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundColor(.black)
                        }
                    }
                    .frame(width: 361, height: 57)
                    .background(.clear)
                }
                .padding(.bottom, 22)
                
                Text("You are from")
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 361, alignment: .leading)
                Menu {
                    Picker("Choose a color", selection: $fromCountry) {
                        ForEach(countries, id: \.self) {
                            Text($0.contryName)
                        }
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.theme.gray005)
                        HStack{
                            Text(fromCountry.contryName)
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 300, alignment: .leading)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundColor(.black)
                        }
                    }
                    .frame(width: 361, height: 57)
                    .background(.clear)
                }
                .padding(.bottom, 22)
                
                Spacer()
                
                Button {
                    // 완료 기능
                    if isOnboarindViewActive {
                        self.isOnboarindViewActive = false
                    }
                    
                    myLanguage = fromCountry
                    targetLanguage = inCountry
                    
                } label: {
                    Text("Complete")
                        .frame(width: .infinity)
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
            .padding(.top, 41)
        }
    }
}

struct PersonalSettingView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalSettingView()
    }
}

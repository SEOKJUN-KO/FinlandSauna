//
//  PersonalSettingView.swift
//  Junction2023-FinlandSauna
//
//  Created by Ko Seokjun on 2023/08/19.
//

import SwiftUI

struct PersonalSettingView: View {
    @State var fromCountry = "Korean"
    @State var inCountry = "Korean"
    var countries = ["Korean", "English", "Vietnam", "Africa"]
    
    var body: some View {
        ZStack(alignment: .top){
            Color(.white)
            VStack(){
                Text("You are in")
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 361, alignment: .leading)
                Menu{
                    Picker("Choose a color", selection: $inCountry) {
                        ForEach(countries, id: \.self) {
                            Text($0)
                        }
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                        HStack{
                            Text(inCountry)
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 300, alignment: .leading)
                                .foregroundColor(.white)
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 361, height: 57)
                    .background(.clear)
                }
                .padding(.bottom, 22)
                
                Text("You are from")
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 361, alignment: .leading)
                Menu{
                    Picker("Choose a color", selection: $fromCountry) {
                        ForEach(countries, id: \.self) {
                            Text($0)
                        }
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                        HStack{
                            Text(fromCountry)
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 300, alignment: .leading)
                                .foregroundColor(.white)
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 361, height: 57)
                    .background(.clear)
                }
                .padding(.bottom, 22)
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

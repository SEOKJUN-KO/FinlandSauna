//
//  Junction2023_FinlandSaunaApp.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import SwiftUI

@main
struct Junction2023_FinlandSaunaApp: App {
    @AppStorage("onboarding") var isOnboarindViewActive: Bool = true
    @AppStorage("myLanguage") var myLanguage: Languages = .en
    @AppStorage("targetLanguage") var targetLanguage: Languages = .th
    var body: some Scene {
        WindowGroup {
            if isOnboarindViewActive {
                PersonalSettingView(fromCountry: myLanguage, inCountry: targetLanguage)
            } else {
                TabView {
                    Text("History")
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("History")
                        }
                    
                    NavigationStack {
                        OrderListView()
                    }
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard.fill")
                        Text("Logitics")
                    }
                    
                    PersonalSettingView(fromCountry: myLanguage, inCountry: targetLanguage)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Personal")
                        }
                }
            }
        }
    }
}

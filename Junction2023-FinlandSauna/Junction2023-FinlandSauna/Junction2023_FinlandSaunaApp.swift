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
    
    var body: some Scene {
        WindowGroup {
            if isOnboarindViewActive {
                PersonalSettingView()
            } else {
                TabView {
                    Text("기록")
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("기록")
                        }
                    
                    NavigationStack {
                        OrderListView()
                    }
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard.fill")
                        Text("물류관리")
                    }
                    
                    Text("개인설정")
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("개인")
                        }
                }
            }
        }
    }
}

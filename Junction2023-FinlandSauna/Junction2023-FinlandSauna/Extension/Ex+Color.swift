//
//  Ex+Color.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255.0
        let green = Double((hex >> 8) & 0xff) / 255.0
        let blue = Double(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

struct ColorTheme {
    // Main
    let main001 = Color("FS_main001")
    let main002 = Color("FS_main002")
    let main003 = Color("FS_main003")
    let main004 = Color("FS_main004")
    let main005 = Color("FS_main005")
    
    // Secondary
    let secondary001 = Color("FS_secondary001")
    let secondary002 = Color("FS_secondary002")
    let secondary003 = Color("FS_secondary003")
    let secondary004 = Color("FS_secondary004")
    let secondary005 = Color("FS_secondary005")
    
    // Gray Scale
    let gray001 = Color("FS_gray001")
    let gray002 = Color("FS_gray002")
    let gray003 = Color("FS_gray003")
    let gray004 = Color("FS_gray004")
    let gray005 = Color("FS_gray005")
    let gray006 = Color("FS_gray006")
    
    // gredient
    let mainGradation001 = LinearGradient(colors: [Color(hex: 0x002F6C), Color(hex: 0xCEE3FF)], startPoint: .top, endPoint: .bottom)
    let grayGradation005 = LinearGradient(colors: [Color(hex: 0xF0F0F0), Color(hex: 0xFAFAFA)], startPoint: .top, endPoint: .bottom)
}

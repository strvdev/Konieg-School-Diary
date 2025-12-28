//
//  UserTheme.swift
//  Konieg
//
//  Created by David I on 20.12.2024.
//

import Foundation
import SwiftUICore
class UserTheme : ObservableObject {
    @Published var theme: Color
    @Published var currentPage: Int
    @Published var themePicker: Bool
    
    let UDM = UserDefaultsManager()
    init() {
        self.theme = Color(hex:UDM.getString(key: "ThemeColor") ?? "#121111")
        self.currentPage = 0
        self.themePicker = false
    }
}

//
//  Resolution.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import Foundation
import SwiftUI
import Combine
class BasicResolution : ObservableObject{
    @Published var resX: CGFloat
    @Published var resY: CGFloat
    init() {
        self.resX = 0.0
        self.resY = 0.0
    }
  
    
}
func hasHomeButton() -> Bool {
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let safeAreaInsets = window.windows.first?.safeAreaInsets
            return safeAreaInsets?.bottom == 0
        }
        return true
    }

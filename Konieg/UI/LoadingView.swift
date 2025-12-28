//
//  LoadingView.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
    
        VStack{
            VisualEffectView()
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .frame(width: resX / 5, height: resY / 10)
                .overlay(
                    ProgressView()
                )
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    LoadingView()
}

//
//  UIVisualEffects.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import SwiftUI


 struct VisualEffectView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: .systemUltraThinMaterialDark)
    }
}




struct ScaleButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .scaleEffect(configuration.isPressed ? 0.85 : 1)
             .animation(.linear(duration: 0.1), value: configuration.isPressed)
             .brightness(configuration.isPressed ? -0.1 : 0)
     }
     
}

extension ButtonStyle where Self == ScaleButtonStyle {
    static var scale: ScaleButtonStyle {
        ScaleButtonStyle()
    }
}

struct BarProgressStyle: ProgressViewStyle {

    var color: Color = Color(hex: "#121111")
    var height: Double = 7.0
    var labelFontStyle: Font = .body

    func makeBody(configuration: Configuration) -> some View {

        let progress = configuration.fractionCompleted ?? 0.0


            VStack(alignment: .center) {

                configuration.label
                    .font(labelFontStyle)

                RoundedRectangle(cornerRadius: 20.0)
                    .fill(Color(uiColor: .systemGray5))
                    .frame(height: height)
                    .frame(width: resX / 1.5)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(color)
                            .frame(width: resX/1.5 * progress)
                            .overlay {
                                if let currentValueLabel = configuration.currentValueLabel {

                                    currentValueLabel
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            }
                    

            }

        }
    }
}

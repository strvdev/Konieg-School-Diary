//
//  Taptic++.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import CoreHaptics
import AudioToolbox
import Foundation
import UIKit

func tapticEngine(energy: CGFloat) {
    if CHHapticEngine.capabilitiesForHardware().supportsHaptics {
        UIImpactFeedbackGenerator().impactOccurred(intensity: energy)
        } else {
            AudioServicesPlaySystemSound(1519) 
        }
}

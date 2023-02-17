//
//  MeditationViewModel.swift
//  MeditationApp
//
//  Created by Igor S. Menezes on 16/02/23.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 Minute Relaxing Meditation", description: "Clear your ming and slumber into nothingness. Allocate only a few moments for a quick breather.", duration: 70, track: "meditation1", image: "image-stones")
}

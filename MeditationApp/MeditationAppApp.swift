//
//  MeditationAppApp.swift
//  MeditationApp
//
//  Created by Igor S. Menezes on 14/02/23.
//

import SwiftUI

@main
struct MeditationAppApp: App {
    @StateObject var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(AudioManager())
            
        }
    }
}

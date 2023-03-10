//
//  PlayerView.swift
//  MeditationApp
//
//  Created by Igor S. Menezes on 15/02/23.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var meditationVM: MeditationViewModel
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        ZStack {
            //MARK: Background Image
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            //MARK: BLUR VIEW
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                // MARK: DISMISS BUTTON
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                }
                //MARK: TITLE
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                //MARK: PLAYBACK
                if let player = audioManager.player {
                    VStack(spacing: 5) {
                        //MARK: PLAYBACK TIMELINE
                        Slider(value: $value, in: 0...player.duration) { editing in
                            
                            print("editing", editing)
                            isEditing = editing
                            if !editing {
                                player.currentTime = value
                            }
                        }
                        .accentColor(.white)
                        
                        //MARK: PLAYBACK TIME
                        
                        HStack {
                            Text(DateComponentsFormatter.positional.string(from:player.currentTime) ?? "0:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    
                    //MARK: PLAYBACK CONTROLLS
                    
                    HStack {
                        //MARK: Repeat Button
                        PlaybackControlButton(systemName: "repeat") {
                            
                        }
                        
                        Spacer()
                        //MARK: Backward Button
                        PlaybackControlButton(systemName: "gobackward.10") {
                            
                        }
                        
                        Spacer()
                        //MARK: Play/pause Button
                        PlaybackControlButton(systemName: player.isPlaying ? "pause.circle.fill" :  "play.circle.fill", fontSize: 44) {
                            audioManager.playPause()
                            
                        }
                        
                        Spacer()
                        
                        //MARK: Forward Button
                        PlaybackControlButton(systemName: "goforward.10") {
                            
                        }
                        
                        Spacer()
                        //MARK: Stop Button
                        PlaybackControlButton(systemName: "stop.fill") {
                            
                        }
                    }
                }
                
            }
            .padding(20)
        }
        .onAppear {
//            AudioManager.shared.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
            
            audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        PlayerView(meditationVM: meditationVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}

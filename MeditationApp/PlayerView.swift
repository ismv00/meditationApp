//
//  PlayerView.swift
//  MeditationApp
//
//  Created by Igor S. Menezes on 15/02/23.
//

import SwiftUI

struct PlayerView: View {
    @State private var value: Double = 0.0
    var body: some View {
        ZStack {
            //MARK: Background Image
            Image("image-stones")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                // MARK: DISMISS BUTTON
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                }
                //MARK: TITLE
                Text("1 Minute Relaxing Meditation")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                //MARK: PLAYBACK
                
                VStack(spacing: 5) {
                    //MARK: PLAYBACK TIMELINE
                    Slider(value: $value, in: 0...60)
                        .accentColor(.white)
                    
                    //MARK: PLAYBACK TIME
                    
                    HStack {
                        Text("0:00")
                        
                        Spacer()
                        
                        Text("1:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
            }
            .padding(20)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
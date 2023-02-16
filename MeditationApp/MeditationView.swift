//
//  MeditationView.swift
//  MeditationApp
//
//  Created by Igor S. Menezes on 14/02/23.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        VStack(spacing: 0) {
            // MARK: IMAGE
            Image("image-stones")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            //MARK: Meditation Details
            ZStack {
                
                //MARK: BACKGROUND
                Color(red: 24/255, green: 23/255, blue: 22/255)
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Music")
                        Text("0s")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    //MARK: TITLE

                    Text("1 Minute Relaxing Meditation")
                        .font(.title)
                    
                    //MARK: PLAY BUTTON
                    Button {
                        
                    } label: {
                         Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(29)
                        
                    }
                    //MARK: DESCRIPTION
                    Text("Clear your mind and slumber into nithingness. Allocate only a few moments for a quick breather.")
                    
                    Spacer()
                }
            }
            .foregroundColor(.white)
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}

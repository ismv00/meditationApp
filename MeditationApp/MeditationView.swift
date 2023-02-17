//
//  MeditationView.swift
//  MeditationApp
//
//  Created by Igor S. Menezes on 14/02/23.
//

import SwiftUI

struct MeditationView: View {
    
    @StateObject var meditationVM: MeditationViewModel
    @State private var showPlayer = false
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: IMAGE
            Image(meditationVM.meditation.image)
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
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ??
                            meditationVM.meditation.duration.formatted() + "s")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    //MARK: TITLE

                    Text(meditationVM.meditation.title)
                        .font(.title)
                    
                    //MARK: PLAY BUTTON
                    Button {
                        showPlayer = true
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
                    Text(meditationVM.meditation.description)
                    
                    Spacer()
                }
            }
            .foregroundColor(.white)
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationVM: meditationVM)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation:Meditation.data)
    static var previews: some View {
        MeditationView(meditationVM: meditationVM)
    }
}

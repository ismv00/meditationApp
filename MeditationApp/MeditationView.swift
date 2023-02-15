//
//  MeditationView.swift
//  MeditationApp
//
//  Created by Igor S. Menezes on 14/02/23.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        VStack {
            //MARK: Image
            Image("image-stones")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 3)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}

//
//  StartView.swift
//  FlappyGame
//
//  Created by Max Valek on 4/24/23.
//

import SwiftUI

struct StartView: View {
    
    @Binding var playGame: Bool
    
    var body: some View {
        
        VStack {
            Button {
                playGame = true
            } label: {
                Text("Start")
                    .font(.largeTitle)
            }

        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(playGame: .constant(false))
    }
}

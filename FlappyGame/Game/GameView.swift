//
//  GameView.swift
//  FlappyGame
//
//  Created by Max Valek on 4/24/23.
//

import SwiftUI

struct GameView: View {
    
    @State var yPosition: CGFloat = UIScreen.main.bounds.height / 2 // initial position in the middle of the screen
    @State var velocity: CGFloat = 0 // initial velocity is 0
    @Binding var playGame: Bool
    let jumpAmount: CGFloat = 10 // how much the bird should jump
    
    var body: some View {
        
        if playGame {
            
            ZStack {
                
                Color.white.ignoresSafeArea()
                
                BirdView(yPosition: $yPosition, velocity: $velocity)
                    
                PipeView()
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                    
                    if yPosition <= 0 || yPosition >= UIScreen.main.bounds.height {
                        playGame = false
                    } else {
                        yPosition += velocity // update the y position based on the current velocity
                        velocity += 1 // apply gravity
                    }
                }
                timer.fire()
            }
            .onTapGesture {
                velocity = -jumpAmount // set the velocity to jump up
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(playGame: .constant(true))
    }
}

//
//  MainView.swift
//  FlappyGame
//
//  Created by Max Valek on 4/24/23.
//

import SwiftUI

struct MainView: View {
    
    @State var playGame: Bool = false
    
    // GameView vars
    @State var yPosition: CGFloat = UIScreen.main.bounds.height / 2 // initial position in the middle of the screen
    @State var velocity: CGFloat = 0 // initial velocity is 0
    let jumpAmount: CGFloat = 10 // how much the bird should jump
    
    var body: some View {
        
        VStack {
            
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
                
            } else {
                
                ZStack {
                    
                    Button {
                        
                        playGame = true
                        
                    } label: {
                        Text("Start")
                            .font(.largeTitle)
                    }

                }
                
            }

        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

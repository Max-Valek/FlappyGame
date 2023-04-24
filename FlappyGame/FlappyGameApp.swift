//
//  FlappyGameApp.swift
//  FlappyGame
//
//  Created by Max Valek on 4/24/23.
//

import SwiftUI

@main
struct FlappyGameApp: App {
    
    @State var playGame: Bool = false
    
    var body: some Scene {
        
        WindowGroup {
            
            if !playGame {
                StartView(playGame: $playGame)
            } else {
                GameView(playGame: $playGame)
            }
            
        }
    }
}

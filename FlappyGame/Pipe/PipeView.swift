//
//  PipeView.swift
//  FlappyGame
//
//  Created by Max Valek on 4/24/23.
//

import SwiftUI

struct PipeView: View {
    
    // size of the gap between the top and bottom pipes
    let gapSize: CGFloat = 100
    // speed at which the pipe moves across the screen
    let speed: CGFloat = 7
    // initial position is off the right edge of the screen
    @State private var xPos: CGFloat = UIScreen.main.bounds.width
    // height of the top pipe
    @State private var topPipeHeight: CGFloat = UIScreen.main.bounds.height / 2
    // height of the bottom pipe
    @State private var bottomPipeHeight: CGFloat = UIScreen.main.bounds.height / 2
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // top pipe
            Rectangle()
                .fill(Color.green)
                .frame(width: 50, height: topPipeHeight - (gapSize / 2))
                .position(x: xPos, y: 0)
            
            // bottom pipe
            Rectangle()
                .fill(Color.red)
                .frame(width: 50, height: bottomPipeHeight - (gapSize / 2))
                .position(x: xPos, y: UIScreen.main.bounds.height - bottomPipeHeight)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                // move the pipe to the left
                xPos -= speed
                // reset pipes when they go off screen
                if xPos < -50 {
                    // all the way right
                    xPos = UIScreen.main.bounds.width
                    // top pipe height (50 to height)
                    topPipeHeight = CGFloat.random(in: 50..<UIScreen.main.bounds.height - 50)
                    // bottom pipe height
                    bottomPipeHeight = CGFloat(UIScreen.main.bounds.height - topPipeHeight)
                }
            }
            timer.fire()
        }
    }
}


struct PipeView_Previews: PreviewProvider {
    static var previews: some View {
        PipeView()
    }
}

//
//  BirdView.swift
//  FlappyGame
//
//  Created by Max Valek on 4/24/23.
//

import SwiftUI

struct BirdView: View {
    
    // bound to game view (changed when screen pressed
    @Binding var yPosition: CGFloat
    @Binding var velocity: CGFloat
    
    var body: some View {
//        Image("bird") // use your own bird sprite image
//            .resizable()
        Circle()
            .frame(width: 50, height: 50)
            .position(x: UIScreen.main.bounds.width / 2, y: yPosition)
    }
}

struct BirdView_Previews: PreviewProvider {
    static var previews: some View {
        BirdView(yPosition: .constant(UIScreen.main.bounds.height / 2), velocity: .constant(0))
    }
}

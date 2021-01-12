//
//  PotView.swift
//  Pot Smack
//
//  Created by Alan Yao on 1/8/21.
//

import SwiftUI
import AVFoundation

struct Shake: GeometryEffect {
    var amount: CGFloat = 3
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            0,
            y: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit))))
    }
}

struct PotView: View {
    @State var attempts = 0
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.default) {
                    self.attempts += 1
                }
                playSound(sound: "pan", type: "mp3")
            }) {
                Image("pot2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 100)
                    .scaleEffect(0.8)
                    .modifier(Shake(animatableData: CGFloat(attempts)))
            }
        }

    }
}

struct PotView_Previews: PreviewProvider {
    static var previews: some View {
        PotView()
    }
}

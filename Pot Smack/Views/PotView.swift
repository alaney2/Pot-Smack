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
    @EnvironmentObject var data: Data
    @State var attempts = 0
    @State var showingProfile = false
    
    var body: some View {
        NavigationView {
            Button(action: {
                withAnimation(.default) {
                    let rand = Double.random(in: 0.3...0.7)
                    self.data.count += 1
                    self.data.seconds += Double(round(rand*1000)/1000)
                    self.attempts += 1
                }
                playSound(sound: "pan", type: "mp3")
            }) {
                Image("pot2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                    .scaleEffect(0.8)
                    .modifier(Shake(animatableData: CGFloat(attempts)))
            }
            .padding(.bottom)
            .toolbar {
                Button(action: {showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileView(showingProfile: self.$showingProfile)
            }
        }
    }
}

struct PotView_Previews: PreviewProvider {
    static var previews: some View {
        PotView()
            .environmentObject(Data())
    }
}

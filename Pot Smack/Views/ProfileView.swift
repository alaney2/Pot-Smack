//
//  ProfileView.swift
//  Pot Smack
//
//  Created by Alan Yao on 1/13/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var data: Data
    
    var body: some View {
        let formatted = String(format: "%.3f", self.data.seconds)
        VStack {
            Text("Count: \(self.data.count)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            Text("Time wasted: \(formatted) s")
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(Color.gray)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(Data())
    }
}

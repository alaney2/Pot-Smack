//
//  ContentView.swift
//  Pot Smack
//
//  Created by Alan Yao on 1/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PotView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Data())
    }
}

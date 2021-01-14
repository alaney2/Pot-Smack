//
//  Pot_SmackApp.swift
//  Pot Smack
//
//  Created by Alan Yao on 1/8/21.
//

import SwiftUI

@main
struct Pot_SmackApp: App {
    @StateObject private var data = Data()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}

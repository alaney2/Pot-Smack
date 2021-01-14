//
//  Data.swift
//  Pot Smack
//
//  Created by Alan Yao on 1/13/21.
//

import Foundation

final class Data: ObservableObject {
    @Published var count: Int = 0
    @Published var seconds: Double = 0.0
}

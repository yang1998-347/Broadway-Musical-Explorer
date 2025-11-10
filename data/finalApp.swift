//
//  finalApp.swift
//
//
//  Created by Yang-Ting Lin on 5/28/25.
//

import SwiftUI

@main
struct finalApp: App {
    
    @StateObject var store = MusicalStore()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(store)
        }
    }
}

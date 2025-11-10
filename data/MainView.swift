//
//  MainView.swift
//
//
//  Created by Yang-Ting Lin on 6/5/25.
//
import SwiftUI
struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("On Broadway", systemImage: "house.fill")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

//
//  FavoritesView.swift
//
//
//  Created by Yang-Ting Lin on 6/5/25.
//
import SwiftUI
import Kingfisher

struct FavoritesView: View {
    @EnvironmentObject var store: MusicalStore
    
    var body: some View {
        NavigationStack {
            List {
                let favoriteMusicals = store.musical_details.filter { store.favorites.contains($0.title) }
                ForEach(favoriteMusicals) { musical in
                    NavigationLink(destination: ReviewView(title: musical.title)) {
                        HStack {
                            KFImage(URL(string: musical.image))
                                .placeholder {
                                    ProgressView()
                                }
                                .cancelOnDisappear(true)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipped()
                            
                            Text(musical.title)
                        }
                    }
                    
                }
            }
            .navigationTitle("My Favorites")
        }
    }
}
#Preview {
    MainView()
        .environmentObject(MusicalStore())
}

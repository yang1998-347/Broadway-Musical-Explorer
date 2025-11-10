//
//  ReviewView.swift
//
//  Created by Yang-Ting Lin on 6/5/25.
//
import SwiftUI

struct ReviewView: View {
    
    let title: String
    @EnvironmentObject var store: MusicalStore
    @State private var reviewText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Review")
                .font(.title2)
                .bold()
            
            TextEditor(text: $reviewText)
                .frame(height: 200)
                .border(Color.gray)

            Button("Save") {
                store.reviews[title] = reviewText
            }
            .padding()
        }
        .padding()
        .onAppear {
            reviewText = store.reviews[title] ?? ""
        }
        .navigationTitle(title)
    }
}

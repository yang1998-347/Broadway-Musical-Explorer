//
//  ContentView.swift
//
//
//  Created by Yang-Ting Lin on 5/28/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @EnvironmentObject var store: MusicalStore
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //search
    @State private var searchText: String = ""
    
    var filteredMusicals: [MusicalPreview] {
            if searchText.isEmpty {
                return store.musical_previews
            } else {
                return store.musical_previews.filter {
                    $0.title.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    var body: some View {
        NavigationStack{
            VStack() {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Musicals on Broadway")
                        .font(.custom("Impact", size: 34))
                        .font(.title)
                        .bold()
                    
                    TextField("Search for a musical", text: $searchText)
                        .font(.custom("Impact", size: 15))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                .background(Color(red: 1.0, green: 0.866, blue: 0.0))
                
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(filteredMusicals) { musical in
                        NavigationLink(destination: MusicalDetailView(id: musical.id)) {
                            VStack {
                                KFImage(URL(string: musical.image))
                                    .placeholder {
                                        ProgressView()
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 200, alignment: .bottom)
                                    .clipped()
                                    .cornerRadius(12)
                                    .shadow(radius: 4)
                                
                                Text(musical.title)
                                    .font(.custom("Impact", size: 21))
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                    .frame(height: 70)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .top)
                        }
                    }
                }
            }
            
        }
    }
    
}
#Preview {
    ContentView()
        .environmentObject(MusicalStore())
}

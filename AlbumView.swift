//
//  AlbumView.swift
//
//
//  Created by Yang-Ting Lin on 6/3/25.
//

import SwiftUI
import Kingfisher

struct AlbumView: View {
    let id : String
    @EnvironmentObject var store: MusicalStore
    
    
    
    var body: some View{
        if let album = store.musical_album.first(where : { $0.id == id }){
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack {
                        Text(album.album)
                            .bold()
                            .font(.custom("Impact", size: 34))
                            .foregroundColor(Color.white)
                            
                    }
                    .padding(.top, 100)
                    .padding(.bottom, 12)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    
                    
                    
                    KFImage(URL(string: album.album_image))
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            if let url = URL(string: album.album_link) {
                                UIApplication.shared.open(url)
                            }
                        }
                        .padding()
                    
                    Text("Songs List:")
                        .font(.custom("Impact", size: 18))
                        .padding(.horizontal)
                    ScrollView {
                        List {
                            ForEach(album.tracks) { track in
                                Link(destination: URL(string: track.track_link)!) {
                                    Text(track.track_name)
                                        .font(.custom("Impact", size: 15))
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        .frame(height: CGFloat(album.tracks.count * 50))
                        .listStyle(PlainListStyle())
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                }
                
            
        }
        .ignoresSafeArea(edges: .top)
        }else {
            Text("Album page error")
        }
        
        
    }
}


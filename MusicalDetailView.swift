//
//  MusicalDetailView.swift
//
//
//  Created by Yang-Ting Lin on 6/2/25.
//

import SwiftUI
import Kingfisher

struct MusicalDetailView: View {
    
    let id : String
    
    @EnvironmentObject var store: MusicalStore
    var body: some View {
        if let musical = store.musical_details.first(where: { $0.id == id }) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack {
                        ZStack {
                          
                            // favorite button
                            HStack {
                                Spacer()
                                Button(action: {
                                    if store.favorites.contains(musical.title) {
                                        store.favorites.removeAll { $0 == musical.title }
                                    } else {
                                        store.favorites.append(musical.title)
                                    }
                                }) {
                                    Image(systemName: store.favorites.contains(musical.title) ? "heart.fill" : "heart")
                                        .padding(.trailing)
                                        .font(.system(size: 30))
                                        .foregroundColor(.red)
                                }
                                .padding(.bottom , 80)
                            }
                            
                            // title
                            Text(musical.title)
                                .font(.custom("Impact", size: 34))
                                .bold()
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                            
                            
                            
                                

                           
                        }
                        .padding(.top, 80)
                        .padding(.bottom, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 1.0, green: 0.866, blue: 0.0))
                        

                    }
                    
                    
                    KFImage(URL(string: musical.image2))
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)            
                        .padding()
                    
                    if let url = URL(string: musical.ticket_link) {
                        Link("🎟️ Tickets", destination: url)
                            .font(.custom("Impact", size: 18))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding()
                    }
                   
                    
                    
                    
                    HStack{
                        Text("\(musical.show_type)")
                            .bold()
                            .font(.custom("Impact", size: 22))
                            .padding(.trailing, 100)
                        if musical.show_type == "Musical" && store.musical_album.contains(where: { $0.id == musical.id }){
                            NavigationLink(destination: AlbumView(id: musical.id)) {
                                Text("Album on Spotify")
                                    .font(.custom("Impact", size: 18))
                                    .bold()
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color(red: 0.114, green: 0.725, blue: 0.329))
                                    .foregroundColor(.black)
                                    .cornerRadius(12)
                            }
                            .padding()
                        }
                            
                    }
                    .padding()
                    HStack{
                        Text("Cast:               ")
                            .bold()
                            .font(.custom("Impact", size: 22))
                            .padding(.trailing, 100)
                        NavigationLink(destination: CastView(id: musical.id)) {
                            Text("Current Cast")
                                .font(.custom("Impact", size: 18))
                                .bold()
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(red: 1.0, green: 0.866, blue: 0.0))
                                .foregroundColor(.black)
                                .cornerRadius(12)
                        }
                        .padding()
                    }
                    .padding()
                        
                    Group{
                        Text("Theatre:  ").bold().font(.custom("Impact", size: 18)) + Text(musical.theater)
                    }
                    .padding()
                    
                    if !musical.close_date.isEmpty {
                        Text("Closing Date: \(musical.close_date)")
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\n" + musical.description.dropFirst().dropLast())
                    
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Synopsis:")
                            .bold()
                            .font(.custom("Impact", size: 18))
                        Text(musical.synopsis.dropFirst(10).dropLast().trimmingCharacters(in: .whitespacesAndNewlines))
                        
                    }
                    .padding()
                    
                    Group{
                        Text("Running Time:\n").bold().font(.custom("Impact", size: 18)) +
                        Text(musical.run_time
                            .replacingOccurrences(of: "Running Time: ", with: ""))
                    }
                    .padding()
                    
                    Group{
                        Text("Schedule:\n").bold().font(.custom("Impact", size: 18)) + Text(musical.schedule
                            .replacingOccurrences(of: "SCHEDULE:", with: ""))
                    }
                    .padding()
                }
                
            }
            .ignoresSafeArea(edges: .top)
            
        } else {
            Text("Musical Detail page error")
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(MusicalStore())
}

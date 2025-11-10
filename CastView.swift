//
//  CastView.swift
//
//
//  Created by Yang-Ting Lin on 6/5/25.
//
import SwiftUI
import Kingfisher

struct CastView: View {
    
    let id : String
    @EnvironmentObject var store: MusicalStore
    var body: some View {
        if let cast = store.musical_cast.first(where: { $0.id == id }) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack {
                        
                        Text(id + "\nCurrent Cast")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom("Impact", size: 34))
                            .foregroundColor(Color(red: 1.0, green: 0.866, blue: 0.0))
                            .padding(.leading)
                            
                    }
                    .padding(.top, 100)
                    .padding(.bottom, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    
                    ForEach(cast.cast_list) { person in
                        HStack(alignment: .top, spacing: 16) {
                            KFImage(URL(string: person.cast_img))
                                .placeholder {
                                    ProgressView()
                                        
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(person.cast_name)
                                    .font(.custom("Impact", size: 18))
                                    .bold()
                                Text(person.cast_role)
                                    .font(.custom("Impact", size: 16))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                        Divider()
                    }
                }
                .padding(.bottom, 32)
            }
            .ignoresSafeArea(edges: .top)
        }else {
            Text("Cast page error")
        }
    }
}


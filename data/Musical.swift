//
//  Musical.swift
//
//
//  Created by Yang-Ting Lin on 5/28/25.
//
import SwiftUI
import Foundation

class MusicalStore: ObservableObject {
    @Published var musical_previews: [MusicalPreview] = []
    @Published var musical_details: [MusicalDetail] = []
    @Published var musical_album: [MusicalAlbum] = []
    @Published var musical_cast: [MusicalCast] = []
    
    //Favorite view
    @Published var favorites: [String] = []{
        didSet {
                    saveFavorites()
                }
    }
    //Review view
    @Published var reviews: [String: String] = [:]{
        didSet {
                    saveReviews()
                }
    }
    
    
    init() {
        loadMusicals()
        loadAlbum()
        loadCast()
        loadFavorites()
        loadReviews()
    }
    
    
    // get info from Musical.json
    func loadMusicals() {
        //read Musical.json
        guard let url = Bundle.main.url(forResource: "musicals", withExtension: "json") else {
            print("can't find musicals.json")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            // get MusicalDetail
            
            musical_details = try decoder.decode([MusicalDetail].self, from: data)
            
            // get MusicalPreview
            self.musical_previews = musical_details.map { musical in
                MusicalPreview(title: musical.title, image: musical.image)
            }
            
        }
        catch {
            print("JSON decode error:\(error)")
        }
    }
    
    func loadAlbum(){
        guard let url = Bundle.main.url(forResource: "musical_spotify_tracks", withExtension: "json") else {
            print("can't find musical_spotify_tracks.json")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            musical_album = try decoder.decode([MusicalAlbum].self, from: data)
            
        } catch {
            print("JSON decode error:\(error)")
        }
    }
    
    func loadCast(){
        guard let url = Bundle.main.url(forResource: "cast", withExtension: "json") else {
            print("can't find cast.json")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            musical_cast = try decoder.decode([MusicalCast].self, from: data)
            
        } catch {
            print("JSON decode error:\(error)")
        }
    }
    
    // saveFavorites
        func saveFavorites() {
            UserDefaults.standard.set(favorites, forKey: "favorites")
        }

        func loadFavorites() {
            if let saved = UserDefaults.standard.stringArray(forKey: "favorites") {
                self.favorites = saved
            }
        }

        //saveReviews
        func saveReviews() {
            if let data = try? JSONEncoder().encode(reviews) {
                UserDefaults.standard.set(data, forKey: "reviews")
            }
        }

        func loadReviews() {
            if let data = UserDefaults.standard.data(forKey: "reviews"),
               let decoded = try? JSONDecoder().decode([String: String].self, from: data) {
                self.reviews = decoded
            }
        }

}


//for second page
struct MusicalDetail: Identifiable, Decodable {
    var id: String { title }
    let title: String
    let theater: String
    let close_date: String
    let image: String
    let image2: String
    let detail_link: String
    let show_type: String
    let description: String
    let synopsis: String
    let schedule: String
    let run_time: String
    let ticket_link: String
}
// for firsat page
struct MusicalPreview: Identifiable {
    var id:String { title }
    let title: String
    let image: String
}

// album
struct MusicalAlbum: Codable, Identifiable {
    var id: String { title }
    let title: String
    let album: String
    let album_link: String
    let album_image: String
    let tracks: [SpotifyTrack]
}

//songs
struct SpotifyTrack: Codable, Identifiable {
    var id: String { track_link }
    let track_name: String
    let track_link: String
}

//Cast
struct MusicalCast: Codable, Identifiable {
    var id: String { title }
    let title: String
    let cast_list: [CastInfo]
}

//Cast info
struct CastInfo: Codable, Identifiable {
    var id: String { cast_name }
    let cast_name: String
    let cast_img: String
    let cast_role: String
}

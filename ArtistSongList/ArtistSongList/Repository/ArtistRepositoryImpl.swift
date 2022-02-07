//
//  ArtistRepositoryImpl.swift
//  ArtistSongList
//
//  Created by 이건준 on 2022/02/06.
//

import Foundation
import Combine

class ArtistRepositoryImpl{
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getArtistWithCombine()->AnyPublisher<Artist, Error> {
        let url = getArtistSongsURLComponents().url
        var request = URLRequest(url: url!)
        request.allHTTPHeaderFields = [
            "x-rapidapi-host": "genius.p.rapidapi.com",
            "x-rapidapi-key": "08bf196f28msha213091208ea7e8p130159jsn16a67c6c46f7"
        ]
        return session.dataTaskPublisher(for: request).map{ $0.data }
    }
}

extension ArtistRepositoryImpl{
    struct ArtistAPI {
        static let scheme = "https"
        static let host = "genius.p.rapidapi.com"
        static let path = "/artists/16775/songs"
    }
    
    func getArtistSongsURLComponents()->URLComponents {
        var components = URLComponents()
        components.scheme = ArtistAPI.scheme
        components.host = ArtistAPI.host
        components.path = ArtistAPI.path
        
        return components
    }
}

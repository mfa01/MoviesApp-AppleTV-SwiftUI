//
//  NetworkManager.swift
//  MoviesPlayer-AppleTv+SwiftUI
//
//  Created by Mabed on 03/07/2022.
//

import Foundation

class NetworkManager {
    
    static var shared = NetworkManager()
    
    func fetchMovies(completion: @escaping ([MovieModel])->()) {
        guard let url = URL(string: "https://fake-movie-database-api.herokuapp.com/api?s=batman") else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] ?? [:]
                    if let jsonValue = json["Search"] {
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonValue, options: .prettyPrinted)
                        let movies = try JSONDecoder().decode([MovieModel].self, from: jsonData)
                        completion(movies)
                    }
                } catch {
                    
                }
            } else {
                completion([])
            }
        }.resume()
    }
}

//
//  MovieModel.swift
//  MoviesPlayer-AppleTv+SwiftUI
//
//  Created by Mabed on 03/07/2022.
//

import Foundation

// MARK: - MovieModel
struct MovieModel: Codable, Identifiable, Hashable {
    let id = UUID()
    let imdbID, title, year: String?
    let poster: String?
    let moviePath = "https://bit.ly/swswift"

    enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}

//
//  Movie.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/25/21.
//

import Foundation

struct Movie: Codable, Equatable {
    let id: Int?
    let title: String?
    let releaseDate: String?
    let posterPath: String?
    let genreIds: [Int]?
    let overview: String?

    private enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
    }
}

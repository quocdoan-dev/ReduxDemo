//
//  MovieResult.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/26/21.
//

import Foundation

struct MovieResult<T: Codable>: Codable {
    let results: [T]
    let page: Int
    let totalPages: Int
    let totalResults: Int

    private enum CodingKeys: String, CodingKey {
        case results, page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

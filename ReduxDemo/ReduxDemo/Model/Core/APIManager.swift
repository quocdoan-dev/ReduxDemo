//
//  APIManager.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/24/21.
//

import Foundation

class APIManager {

    var apiKey = "1f54bd990f1cdfb230adb312546d765d"
    let baseUrl = "https://api.themoviedb.org/3"
    let locale = Locale.preferredLanguages.first ?? "en-US"

    func request<T: Codable>(_ url: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: url) else {
            return completion(nil)
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let response = data.toObject(T.self) else {
                      return completion(nil)
                  }
            completion(response)
        }
        task.resume()
    }
}

extension APIManager {
    
    func fetchUpcomingMovies(page: Int, completion: @escaping (MovieResult<Movie>?) -> Void) {
        request(
            "\(baseUrl)/movie/upcoming?api_key=\(apiKey)&language=\(locale)&page=\(page)",
            completion: completion
        )
    }
}

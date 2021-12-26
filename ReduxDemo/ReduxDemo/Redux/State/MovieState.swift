//
//  MovieState.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/26/21.
//

import ReSwift

struct MovieState {
    var moviesPage: MoviePage<Movie> = MoviePage<Movie>()
    var movies: [Movie] {
        return moviesPage.values
    }
}

//
//  MovieReducer.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/26/21.
//

import ReSwift

extension Reducers {
    static func movieReducer(action: Action, state: MovieState?) -> MovieState {
        var state = state ?? MovieState()
        guard let action = action as? MovieAction else { return state }
        switch action {
        case .fetchUpcomingMovies(let totalPages, let movies):
            let values = movies.filter { movie in
                !state.movies.contains(where: { $0.id == movie.id })
            }
            state.moviesPage.addPages(totalPages: totalPages, values: values)
        }
        return state
    }
}

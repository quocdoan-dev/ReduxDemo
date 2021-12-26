//
//  TopViewModel.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/25/21.
//

import Foundation
import ReSwift
import ReSwiftThunk

final class TopViewModel {
    
    var movies: [Movie] = []

    func numberOfRows(in section: Int) -> Int {
        return movies.count
    }

    func cellForRow(at indexPath: IndexPath) -> MovieCellViewModel {
        return MovieCellViewModel(movie: movies[indexPath.row])
    }

    let fetchUpcomingMovies = Thunk<AppState> { dispatch, getState in
        guard let state = getState(),
              !state.movieState.moviesPage.isComplete else { return }
        let page = state.movieState.moviesPage.currentPage + 1
        APIManager().fetchUpcomingMovies(page: page) { response in
            guard let response = response else {
                return
            }
            DispatchQueue.main.async {
                dispatch(MovieAction.fetchUpcomingMovies(totalPages: response.totalPages,
                                                         movies: response.results))
            }
        }
    }
}

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
        APIManager().fetchUpcomingMovies(page: 1) { response in
            guard let response = response else {
                return
            }
            DispatchQueue.main.async {
                dispatch(MovieAction.fetchUpcomingMovies(movies: response.results))
            }
        }
    }
}

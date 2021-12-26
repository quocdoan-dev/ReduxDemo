//
//  Middlewares.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import Foundation
import ReSwift
import ReSwiftThunk

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

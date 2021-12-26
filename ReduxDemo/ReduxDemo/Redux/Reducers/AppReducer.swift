//
//  AppReducer.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import Foundation
import ReSwift

enum Reducers {
    static func appReducer(action: Action, state: AppState?) -> AppState {
        return AppState(counterState: Reducers.counterReducer(action: action, state: state?.counterState),
                        movieState: Reducers.movieReducer(action: action, state: state?.movieState))
    }
}

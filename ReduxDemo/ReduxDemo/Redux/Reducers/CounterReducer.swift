//
//  CounterReducer.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import Foundation
import ReSwift

extension Reducers {
    static func counterReducer(action: Action, state: CounterState?) -> CounterState {
        var state = state ?? CounterState(counter: -10)
        switch action {
        case is CounterAction.Increase:
            state.counter += 1
        case is CounterAction.Decrease:
            state.counter -= 1
        default:
            state.counter = 0
        }
        return state
    }
}

//
//  LoginReducer.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import Foundation
import ReSwift

extension Reducers {
    static func loginReducer(action: Action, state: LoginState?) -> LoginState {
        var state = state ?? LoginState(counter: -10)
        switch action {
        case is LoginAction.Increase:
            state.counter += 1
        case _ as LoginAction.Decrease:
            state.counter -= 1
        default:
            state.counter = 0
        }
        return state
    }
}

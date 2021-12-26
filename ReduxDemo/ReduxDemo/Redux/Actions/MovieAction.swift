//
//  MovieAction.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/26/21.
//

import Foundation
import ReSwift

enum MovieAction: Action {
    case fetchUpcomingMovies(totalPages: Int, movies: [Movie])
}

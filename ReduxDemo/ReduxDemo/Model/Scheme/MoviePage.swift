//
//  MoviePage.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/26/21.
//

import Foundation

struct MoviePage<T: Equatable>: Equatable {
    var values: [T] = []
    var currentPage: Int = 0
    var totalPages: Int = 1
    var isComplete: Bool {
        return currentPage >= totalPages
    }

    mutating func addPages(totalPages: Int, values: [T]) {
        self.totalPages = totalPages
        self.currentPage += 1
        self.values.append(contentsOf: values)
    }
}

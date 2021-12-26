//
//  NetworkService.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/24/21.
//

import Foundation
import ReSwift

protocol NetworkService {
    func request(_ request: HttpRequest, dispatch: @escaping DispatchFunction)
}

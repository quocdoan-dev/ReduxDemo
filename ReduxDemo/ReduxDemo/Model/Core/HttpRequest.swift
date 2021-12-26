//
//  HttpRequest.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/24/21.
//

import Foundation
import ReSwift

protocol HttpRequest {

    var parameters: String { get }
    var method: HttpMethod { get }
    var json: Data? { get }

    func onSuccess(response: Data?) -> [Action]
    func onFailure(response: Data?) -> [Action]
}

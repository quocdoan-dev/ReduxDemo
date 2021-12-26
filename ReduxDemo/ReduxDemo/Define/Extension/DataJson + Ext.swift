//
//  DataJson + Ext.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/24/21.
//

import Foundation

extension Data {
    func toObject<T: Codable>(_ type: T.Type) -> T? {
        return try? JSONDecoder().decode(type, from: self)
    }
}

//
//  Data+Extensions.swift
//  arlene-ios-sdk
//
//  Created by Macbook on 6/20/19.
//  Copyright © 2019 Arlen. All rights reserved.
//

import Foundation

internal extension Data {
    var toString : String { return NSString(data: self, encoding: String.Encoding.utf8.rawValue)! as String }
    
    init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }
    
    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.load(as: T.self) }
    }
    
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

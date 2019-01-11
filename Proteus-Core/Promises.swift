//
//  Future.swift
//  Proteus-Core
//
//  Created by Eddie Long on 11/01/2019.
//  Copyright © 2019 eddielong. All rights reserved.
//
// Taken from https://www.swiftbysundell.com/posts/under-the-hood-of-futures-and-promises-in-swift

import Foundation

public class Promise<Value>: Future<Value> {
    init(value: Value? = nil) {
        super.init()
        
        // If the value was already known at the time the promise
        // was constructed, we can report the value directly
        result = value.map(Result.value)
    }
    
    func resolve(with value: Value) {
        result = .value(value)
    }
    
    func reject(with error: Error) {
        result = .error(error)
    }
}

public class Future<Value> {
    
    enum Result<Value> {
        case value(Value)
        case error(Error)
    }
    
    fileprivate var result: Result<Value>? {
        // Observe whenever a result is assigned, and report it
        didSet { result.map(report) }
    }
    private lazy var callbacks = [(Result<Value>) -> Void]()
    
    func observe(with callback: @escaping (Result<Value>) -> Void) {
        callbacks.append(callback)
        
        // If a result has already been set, call the callback directly
        result.map(callback)
    }
    
    private func report(result: Result<Value>) {
        for callback in callbacks {
            callback(result)
        }
    }
}

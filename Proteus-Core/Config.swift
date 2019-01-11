//
//  Config.swift
//  Proteus-Core
//
//  Created by Eddie Long on 11/01/2019.
//  Copyright © 2019 eddielong. All rights reserved.
//

import Foundation

open class Config {

    public let plist: NSDictionary?
    
    public init() {
        #if DEBUG
            guard let path = Bundle.main.path(forResource: "config", ofType: "plist") else {
                fatalError("Missing config.plist file")
            }
            self.plist = NSDictionary.init(contentsOfFile: path)
        
        #else
       
        #endif
    }
}

extension Config {
    
    public func getKey<T>(key: String) -> T {
        guard let api = self.plist?.object(forKey: key) else {
            fatalError("Missing \(key) in plist config file")
        }
        return api as! T
    }
}

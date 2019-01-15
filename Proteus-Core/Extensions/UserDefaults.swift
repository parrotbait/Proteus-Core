//
//  UserDefaults.swift
//  CorkWeather
//
//  Created by Eddie Long on 14/01/2019.
//  Copyright © 2019 eddielong. All rights reserved.
//

import Foundation

public extension UserDefaults {
    public func contains(_ key: String) -> Bool {
        return object(forKey: key) == nil
    }
}

//
//  DegreesToRadians.swift
//  Cork Weather
//
//  Created by Eddie Long on 26/09/2017.
//  Copyright © 2017 eddielong. All rights reserved.
//

import Foundation

public extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

public extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

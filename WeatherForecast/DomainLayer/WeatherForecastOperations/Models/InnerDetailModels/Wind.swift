//
//  Wind.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

// MARK: - Wind
class Wind: Codable {
    let speed, deg: Double?

    init(speed: Double?, deg: Double?) {
        self.speed = speed
        self.deg = deg
    }
}

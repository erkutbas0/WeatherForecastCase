//
//  Wind.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

// MARK: - Wind
class Wind: Codable {
    let speed, deg: Int?

    init(speed: Int?, deg: Int?) {
        self.speed = speed
        self.deg = deg
    }
}

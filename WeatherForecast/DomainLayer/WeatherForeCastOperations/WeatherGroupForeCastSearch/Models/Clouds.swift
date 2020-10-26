//
//  Clouds.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

// MARK: - Clouds
class Clouds: Codable {
    let all: Int?

    init(all: Int?) {
        self.all = all
    }
}


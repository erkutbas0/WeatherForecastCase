//
//  WeatherGroupSearhResponse.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

// MARK: - CityWeatherData
class WeatherGroupSearhResponse: Codable {
    let cnt: Int?
    let list: [CityWeatherData]?

    init(cnt: Int?, list: [CityWeatherData]?) {
        self.cnt = cnt
        self.list = list
    }
}

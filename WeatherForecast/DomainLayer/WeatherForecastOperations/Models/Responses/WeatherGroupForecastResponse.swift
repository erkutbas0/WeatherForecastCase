//
//  WeatherGroupForecastResponse.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

// MARK: - CityWeatherData
class WeatherGroupForecastResponse: BaseResponseProtocol {
    let cnt: Int?
    let list: [CityWeatherData]?
    let cod: String?
    let message: Double?

    init(cnt: Int?, list: [CityWeatherData]?, cod: String?, message: Double?) {
        self.cnt = cnt
        self.list = list
        self.cod = cod
        self.message = message
    }
}

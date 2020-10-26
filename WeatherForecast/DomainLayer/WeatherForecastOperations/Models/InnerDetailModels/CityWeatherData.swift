//
//  CityWeatherData.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

// MARK: - CityWeatherData
class CityWeatherData: Codable {
    let coord: Coordinates?
    let sys: SysInfo?
    let weather: [Weather]?
    let main: CityWeatherMainData?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt, id: Int?
    let name: String?

    init(coord: Coordinates?, sys: SysInfo?, weather: [Weather]?, main: CityWeatherMainData?, visibility: Int?, wind: Wind?, clouds: Clouds?, dt: Int?, id: Int?, name: String?) {
        self.coord = coord
        self.sys = sys
        self.weather = weather
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.id = id
        self.name = name
    }
}

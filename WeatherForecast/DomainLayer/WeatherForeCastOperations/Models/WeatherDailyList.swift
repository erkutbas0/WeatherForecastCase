//
//  WeatherDailyList.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import Foundation

// MARK: - List
class WeatherDailyList: CodableDataProtocol {
    let dt, sunrise, sunset: Int?
    let temp: Temprature?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let weather: [Weather]?
    let speed: Double?
    let deg, clouds: Int?
    let pop, rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity, weather, speed, deg, clouds, pop, rain
    }

    init(dt: Int?, sunrise: Int?, sunset: Int?, temp: Temprature?, feelsLike: FeelsLike?, pressure: Int?, humidity: Int?, weather: [Weather]?, speed: Double?, deg: Int?, clouds: Int?, pop: Double?, rain: Double?) {
        self.dt = dt
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.weather = weather
        self.speed = speed
        self.deg = deg
        self.clouds = clouds
        self.pop = pop
        self.rain = rain
    }
}

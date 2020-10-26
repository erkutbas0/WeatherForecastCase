//
//  SysInfo.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

// MARK: - Sys
class SysInfo: Codable {
    let country: String?
    let timezone, sunrise, sunset: Int?

    init(country: String?, timezone: Int?, sunrise: Int?, sunset: Int?) {
        self.country = country
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

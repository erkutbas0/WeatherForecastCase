//
//  Temprature.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import Foundation

// MARK: - Temp
class Temprature: CodableDataProtocol {
    let day, min, max, night: Double?
    let eve, morn: Double?

    init(day: Double?, min: Double?, max: Double?, night: Double?, eve: Double?, morn: Double?) {
        self.day = day
        self.min = min
        self.max = max
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

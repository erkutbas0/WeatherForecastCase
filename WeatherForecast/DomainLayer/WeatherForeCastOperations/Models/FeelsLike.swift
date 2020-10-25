//
//  FeelsLike.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import Foundation

// MARK: - FeelsLike
class FeelsLike: CodableDataProtocol {
    let day, night, eve, morn: Double?

    init(day: Double?, night: Double?, eve: Double?, morn: Double?) {
        self.day = day
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

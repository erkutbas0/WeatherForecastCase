//
//  Coordinates.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import Foundation

// MARK: - Coord
class Coordinates: CodableDataProtocol {
    let lon, lat: Double?

    init(lon: Double?, lat: Double?) {
        self.lon = lon
        self.lat = lat
    }
}

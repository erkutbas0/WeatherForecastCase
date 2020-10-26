//
//  City.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import Foundation

// MARK: - City
class City: CodableDataProtocol {
    let id: Int?
    let name: String?
    let coord: Coordinates?
    let country: String?
    let population, timezone: Int?

    init(id: Int?, name: String?, coord: Coordinates?, country: String?, population: Int?, timezone: Int?) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
        self.timezone = timezone
    }
}

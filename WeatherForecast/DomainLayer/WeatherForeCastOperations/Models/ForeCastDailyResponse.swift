//
//  ForeCastDailyResponse.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import Foundation

// MARK: - ProductListResponse
class ForeCastDailyResponse: CodableDataProtocol {
    let city: City?
    let cod: String?
    let message: Double?
    let cnt: Int?
    let list: [WeatherDailyList]?

    init(city: City?, cod: String?, message: Double?, cnt: Int?, list: [WeatherDailyList]?) {
        self.city = city
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
    }
}

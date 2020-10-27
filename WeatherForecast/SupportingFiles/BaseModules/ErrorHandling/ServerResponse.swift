//
//  ServerResponse.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

class ServerResponse: Codable, Error {
    let cod: String?
    let message: String?

    init(cod: String? = nil, message: String? = nil) {
        self.cod = cod
        self.message = message
    }
}

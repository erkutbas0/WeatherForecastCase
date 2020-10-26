//
//  ServerResponse.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

class ServerResponse: Codable, Error {
    let returnMessage: String?
    let returnCode: Int?

    init(returnMessage: String? = nil, returnCode: Int? = nil) {
        self.returnMessage = returnMessage
        self.returnCode = returnCode
    }
}

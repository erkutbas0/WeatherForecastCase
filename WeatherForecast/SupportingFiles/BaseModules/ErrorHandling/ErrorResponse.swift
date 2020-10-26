//
//  ErrorResponse.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

class ErrorResponse: Error {
    let serverResponse: ServerResponse?
    let apiConnectionErrorType: ApiConnectionErrorType?

    init(serverResponse: ServerResponse? = nil, apiConnectionErrorType: ApiConnectionErrorType? = nil) {
        self.serverResponse = serverResponse
        self.apiConnectionErrorType = apiConnectionErrorType
    }

}

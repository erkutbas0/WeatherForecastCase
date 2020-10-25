//
//  ApiConnectionErrorType.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

enum ApiConnectionErrorType {
    case missingData(Int)
    case connectionError(Int)
    case serverError(Int)
    case dataDecodedFailed(String)
}

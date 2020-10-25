//
//  HeaderFields.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

enum HTTPHeaderFields: GenericDescriptorProtocol {
    typealias Value = (String, String)
    
    case contentType
    case build
    
    var value: (String, String) {
        switch self {
        case .contentType:
            return ("Content-Type", "application/json; charset=utf-8")
        case .build:
            return ("Build", "85")
        }
    }

}

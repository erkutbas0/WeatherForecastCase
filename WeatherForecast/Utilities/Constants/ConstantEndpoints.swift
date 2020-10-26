//
//  ConstantEndpoints.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

struct ConstantEndpoints {
    
    // MARK: - BaseUrls according to environments -
    struct BaseUrls {
        static let developmentBaseEndpointUrl = "https://api.openweathermap.org/"
        static let testBaseEndpointUrl = "https://api.openweathermap.org/"
        static let qualityAssuranceBaseEndpointUrl = "https://api.openweathermap.org/"
    }
    
    // MARK: - Paths ... -
    enum Paths {
        case groupForecast
        case dailyForecast
        
        /*
         
         other paths....
         
         */
        
        // MARK: - Endpoint Paths -
        var path: String {
            switch self {
            // MARK: - Authentication Endpoints -
            case .groupForecast:
                return "data/2.5/group"
            case .dailyForecast:
                return "data/2.5/forecast/daily"
            }
        }
    }
    
}

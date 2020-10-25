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
        static let developmentBaseEndpointUrl = "https://api.trendyol.com/"
        static let testBaseEndpointUrl = "https://api.trendyol.com/"
        static let qualityAssuranceBaseEndpointUrl = "https://api.trendyol.com/"
    }
    
    // MARK: - Paths ... -
    enum Paths {
        case widget
        
        /*
         
         other paths....
         
         */
        
        // MARK: - Endpoint Paths -
        var path: String {
            switch self {
            // MARK: - Authentication Endpoints -
            case .widget:
                return "zeus/widget/display"
            }
        }
    }
    
}

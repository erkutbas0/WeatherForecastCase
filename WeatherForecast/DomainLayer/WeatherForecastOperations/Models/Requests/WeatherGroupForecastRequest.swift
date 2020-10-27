//
//  WeatherGroupForecastRequest.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class WeatherGroupForecastRequest: CodableDataProtocol {
    
    private(set) var cityIds: String
    private(set) var units: String = "metric"
    private(set) var appId: String = UtilityManager.appId
    
    init(cityIds: String) {
        self.cityIds = cityIds
    }
    
    enum CodingKeys: String, CodingKey {
        case cityIds = "id"
        case appId = "appid"
        case units
    }
    
}

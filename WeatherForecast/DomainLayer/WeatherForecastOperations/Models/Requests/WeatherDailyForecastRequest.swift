//
//  WeatherDailyForecastRequest.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class WeatherDailyForecastRequest: CodableDataProtocol {
    
    private(set) var queryCity: String
    private(set) var units: String = "metric"
    private(set) var dailyCount: Int = 16
    private(set) var appId: String = UtilityManager.appId
    
    init(queryCity: String, dailyCount: Int) {
        self.queryCity = queryCity
        self.dailyCount = dailyCount
    }
    
    enum CodingKeys: String, CodingKey {
        case queryCity = "q"
        case units
        case appId = "appid"
        case dailyCount = "cnt"
    }
    
}

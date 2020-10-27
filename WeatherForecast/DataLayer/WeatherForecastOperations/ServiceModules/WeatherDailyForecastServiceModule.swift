//
//  WeatherDailyForecastServiceModule.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class WeatherDailyForecastServiceModule: ApiServiceProvider<WeatherDailyForecastRequest> {
    
    init(request: WeatherDailyForecastRequest) {
        super.init(method: .get, path: ConstantEndpoints.Paths.dailyForecast.path, data: request)
    }
    
}

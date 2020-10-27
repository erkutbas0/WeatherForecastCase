//
//  WeatherGroupForecastServiceModule.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class WeatherGroupForecastServiceModule: ApiServiceProvider<WeatherGroupForecastRequest> {
    
    init(request: WeatherGroupForecastRequest) {
        super.init(method: .get, path: ConstantEndpoints.Paths.groupForecast.path, data: request)
    }
    
}

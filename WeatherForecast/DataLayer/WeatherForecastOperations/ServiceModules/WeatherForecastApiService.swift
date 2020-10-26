//
//  WeatherForecastApiService.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

class WeatherForecastApiService {
    
    func getWeatherGroupForecastApiServiceModule(request: WeatherGroupForecastRequest) -> WeatherGroupForecastServiceModule {
        return WeatherGroupForecastServiceModule(request: request)
    }
    
    func getWeatherDailyForecastApiServiceModule(request: WeatherDailyForecastRequest) -> WeatherDailyForecastServiceModule {
        return WeatherDailyForecastServiceModule(request: request)
    }
    
    deinit {
        print("DEINIT WeatherForecastApiService")
    }
    
}

//
//  WeatherForecastApiRemote.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class WeatherForecastApiRemote: WeatherForecastRemoteInterface {
    
    private let apiManager: HttpClientInterface
    private let apiService: WeatherForecastApiService
    
    init(apiManager: HttpClientInterface, apiService: WeatherForecastApiService) {
        self.apiManager = apiManager
        self.apiService = apiService
    }
    
    func getCurrentGroupForecast(params: WeatherGroupForecastRequest) -> Single<WeatherGroupForecastResponse> {
        return apiManager.executeRequest(urlRequestConvertible: apiService.getWeatherGroupForecastApiServiceModule(request: params))
    }
    
    func getDailyForecast(params: WeatherDailyForecastRequest) -> Single<WeatherDailyForecastResponse> {
        return apiManager.executeRequest(urlRequestConvertible: apiService.getWeatherDailyForecastApiServiceModule(request: params))
    }
    
}

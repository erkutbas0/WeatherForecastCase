//
//  WeatherForecastRepository.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class WeatherForecastRepository: WeatherForecastRepositoryInterface {
    
    private let apiRemote: WeatherForecastRemoteInterface!
    
    init(apiRemote: WeatherForecastRemoteInterface) {
        self.apiRemote = apiRemote
    }
    
    func getCurrentGroupForecast(params: WeatherGroupForecastRequest) -> Single<WeatherGroupForecastResponse> {
        return apiRemote.getCurrentGroupForecast(params: params)
    }
    
    func getDailyForecast(params: WeatherDailyForecastRequest) -> Single<WeatherDailyForecastResponse> {
        return apiRemote.getDailyForecast(params: params)
    }

}

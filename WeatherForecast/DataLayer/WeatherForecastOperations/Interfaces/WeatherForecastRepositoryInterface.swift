//
//  WeatherForecastRepositoryInterface.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

protocol WeatherForecastRepositoryInterface {
    
    func getCurrentGroupForecast(params: WeatherGroupForecastRequest) -> Single<WeatherGroupForecastResponse>
    func getDailyForecast(params: WeatherDailyForecastRequest) -> Single<WeatherDailyForecastResponse>
    
}

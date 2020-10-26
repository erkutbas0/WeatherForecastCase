//
//  WeatherForecastRemoteInterface.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

protocol WeatherForecastRemoteInterface {
    
    func getCurrentGroupForecast(params: WeatherGroupForecastRequest) -> Single<WeatherGroupForecastResponse>
    func getDailyForecast(params: WeatherDailyForecastRequest) -> Single<WeatherDailyForecastResponse>
}

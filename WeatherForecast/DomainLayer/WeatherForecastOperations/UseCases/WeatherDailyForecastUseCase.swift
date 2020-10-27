//
//  WeatherDailyForecastUseCase.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class WeatherDailyForecastUseCase: SingleUseCase<WeatherDailyForecastRequest, WeatherDailyForecastResponse> {
    
    private let repository: WeatherForecastRepositoryInterface

    init(repository: WeatherForecastRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: WeatherDailyForecastRequest) -> Single<WeatherDailyForecastResponse>? {
        return repository.getDailyForecast(params: parameter)
    }
    
}

//
//  WeatherGroupForecastUseCase.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class WeatherGroupForecastUseCase: SingleUseCase<WeatherGroupForecastRequest, WeatherGroupForecastResponse> {
    
    private let repository: WeatherForecastRepositoryInterface

    init(repository: WeatherForecastRepositoryInterface) {
        self.repository = repository
    }

    override func generateUseCase(parameter: WeatherGroupForecastRequest) -> Single<WeatherGroupForecastResponse>? {
        return repository.getCurrentGroupForecast(params: parameter)
    }
    
}

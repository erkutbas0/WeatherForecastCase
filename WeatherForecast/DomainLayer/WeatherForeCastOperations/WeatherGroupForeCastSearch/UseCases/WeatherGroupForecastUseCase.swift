//
//  WeatherGroupForecastUseCase.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class WeatherGroupForecastUseCase: SingleUseCase<WeatherGroupSearhRequest, WeatherGroupSearhResponse> {
    
    private let repository: WidgetRepositoryInterface
    
    init(repository: WidgetRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: WidgetRequest) -> Single<WidgetResponse>? {
        return repository.getWidgetData(request: parameter)
    }
    
    deinit {
        print("DEINIT WidgetListUseCase")
    }
    
}

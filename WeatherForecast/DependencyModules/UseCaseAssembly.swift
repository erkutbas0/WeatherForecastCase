//
//  UseCaseAssembly.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(WeatherGroupForecastUseCase.self, initializer: WeatherGroupForecastUseCase.init).inObjectScope(.weak)
        container.autoregister(WeatherDailyForecastUseCase.self, initializer: WeatherDailyForecastUseCase.init).inObjectScope(.weak)
    }
}

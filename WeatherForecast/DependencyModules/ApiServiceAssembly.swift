//
//  ApiServiceAssembly.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ApiServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(WeatherForecastApiService.self, initializer: WeatherForecastApiService.init).inObjectScope(.weak)
    }
}

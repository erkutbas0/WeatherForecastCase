//
//  RepositoryAssembly.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(WeatherForecastRepositoryInterface.self, initializer: WeatherForecastRepository.init).inObjectScope(.weak)
    }
}

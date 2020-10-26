//
//  CoordinatorsAssembly.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class CoordinatorsAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init).inObjectScope(.container)
        container.autoregister(SplashScreenCoordinator.self, initializer: SplashScreenCoordinator.init).inObjectScope(.weak)
        container.autoregister(MainCoordinator.self, initializer: MainCoordinator.init).inObjectScope(.container)
        container.autoregister(CitySearchCoordinator.self, initializer: CitySearchCoordinator.init).inObjectScope(.weak)
    }
}

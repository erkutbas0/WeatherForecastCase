//
//  FactoryAssembly.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class FactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MainViewFactoryBuilderInterface.self, initializer: MainViewFactoryBuilder.init).inObjectScope(.weak)
        container.autoregister(CitySearchViewFactoryInterface.self, initializer: CitySearchViewFactory.init).inObjectScope(.weak)
    }
}

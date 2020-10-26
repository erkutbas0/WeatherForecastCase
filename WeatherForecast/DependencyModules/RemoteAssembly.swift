//
//  RemoteAssembly.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class RemoteAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(WeatherForecastRemoteInterface.self, initializer: WeatherForecastApiRemote.init).inObjectScope(.weak)
    }
}

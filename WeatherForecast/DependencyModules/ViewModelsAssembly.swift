//
//  ViewModelsAssembly.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ViewModelsAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(AppViewModel.self, initializer: AppViewModel.init).inObjectScope(.container)
        container.autoregister(MainViewModel.self, initializer: MainViewModel.init).inObjectScope(.weak)
        container.autoregister(SplashScreenViewModel.self, initializer: SplashScreenViewModel.init).inObjectScope(.weak)
        container.autoregister(CitySearchViewModel.self, initializer: CitySearchViewModel.init).inObjectScope(.weak)
        container.autoregister(DailyDetailViewModel.self, initializer: DailyDetailViewModel.init).inObjectScope(.weak)
    }
}

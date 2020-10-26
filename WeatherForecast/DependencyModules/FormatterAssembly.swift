//
//  FormatterAssembly.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//
import Foundation
import Swinject
import SwinjectAutoregistration

class FormatterAssembly: Assembly {
    func assemble(container: Container) {
        //container.autoregister(MainViewModelFormatter.self, initializer: MainViewModelFormatter.init).inObjectScope(.container)
    }
}

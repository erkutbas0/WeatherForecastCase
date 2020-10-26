//
//  ManagerAssembly.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import Alamofire

class ManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(NetworkConnectionManager.self, initializer: NetworkConnectionManager.init)
        container.autoregister(CoreDataManager.self, initializer: CoreDataManager.init).inObjectScope(.weak)
        container.autoregister(TutorialManager.self, initializer: TutorialManager.init)
        container.autoregister(RequestRetrier.self, initializer: ApiRetrier.init).inObjectScope(.container)
        container.autoregister(RequestAdapter.self, initializer: ApiAdapter.init).inObjectScope(.container)
        container.autoregister(ApiInterceptor.self, initializer: ApiInterceptor.init).inObjectScope(.container)
        container.autoregister(ApiEventMonitor.self, initializer: ApiEventMonitor.init).inObjectScope(.container)
        container.autoregister(HttpClientInterface.self, initializer: ApiManager.init).inObjectScope(.container)
        container.autoregister(ImageCacheManager.self, initializer: ImageCacheManager.init).inObjectScope(.container)
    }
}

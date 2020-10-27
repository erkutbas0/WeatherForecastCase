//
//  AppCoordinator.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxSwift
import Swinject

class AppCoordinator: BaseCoordinator<AppViewModel> {
    
    private let disposeBag = DisposeBag()
    private let networkConnectionManager: NetworkConnectionManager
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    
    init(networkConnectionManager: NetworkConnectionManager, appViewModel: AppViewModel) {
        self.networkConnectionManager = networkConnectionManager
        
        super.init(viewModel: appViewModel)
        
    }

    private lazy var commonApplicationLauncher: OnCompletedBool = { [weak self] completed in
        if completed {
            //self?.launchApplication()
            self?.launchMainProcess()
        }
    }
    
    override func start() {
        window.makeKeyAndVisible()
        loadSplashScreen()
    }
    
    private func launchApplication() {
        
        launchMainProcess()
        
//        switch UserDefaultsGenericStructStore.hasLaunchBefore {
//        case .launched:
//            /*
//             We do not have a authentication flow, login, register etc for this assignment.
//             if we do, a session manager can decide either go to login, register or to main screens
//             */
//            launchMainProcess()
//        case .notLaunched:
//            launchTutorialProcess()
//        }

    }
    
    // MARK: - Main Screens Implementations -
    private func launchMainProcess() {
        removeChildCoordinators()

        guard let coordinator = AssemblerResolver.resolve(MainCoordinator.self) else { return }
        start(coordinator: coordinator)

        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.navigationController, withAnimation: true)

    }
    
    // MARK: - Tutorial Screens Implementations -
    private func launchTutorialProcess() {
//        UserDefaultsGenericStructStore.hasLaunchBefore = .launched
//
//        guard let coordinator = AssemblerResolver.resolve(TutorialCoordinator.self) else { return }
//        start(coordinator: coordinator)
//
//        coordinator.listenTutorialCoordinatorFinishes(completion: commonApplicationLauncher).disposed(by: disposeBag)
//
//        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
        
    }
    
    // MARK: - Splash Screen Implemententations -
    private func loadSplashScreen() {
        removeChildCoordinators()
        guard let coordinator = AssemblerResolver.resolve(SplashScreenCoordinator.self) else { return }
        start(coordinator: coordinator)
        
        coordinator.listenSplahCoordinatorFinishes(completion: commonApplicationLauncher).disposed(by: disposeBag)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
        
    }
    
    private func registerTutorialObservers() {
        
    }
    
}

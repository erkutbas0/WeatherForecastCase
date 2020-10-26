//
//  MainCoordinator.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class MainCoordinator: BaseCoordinator<MainViewModel> {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        
        let mainViewController = MainViewController(viewModel: viewModel)
        navigationController.viewControllers = [mainViewController]
        
        subscribeForFurtherCoordinators()
        
    }
    
    private func subscribeForFurtherCoordinators() {
        viewModel.subscribeFireCitySearch { [weak self] in
            self?.gotoCitySearchCoordinator()
        }.disposed(by: disposeBag)
    }
    
    private func gotoCitySearchCoordinator() {
        guard let coordinator = AssemblerResolver.resolve(CitySearchCoordinator.self) else { return }
        start(coordinator: coordinator)
        
        navigationController.present(coordinator.viewContoller, animated: true, completion: nil)
    }
    
    deinit {
        print("DEINIT MainCoordinator")
    }
    
}

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

        viewModel.subscribeDetailForecastPublisher { [weak self](data) in
            self?.fireDetailCoordinator(data: data)
        }.disposed(by: disposeBag)
        
    }
    
    private func fireDetailCoordinator(data: WeatherDailyForecastResponse) {
        guard let factory = AssemblerResolver.resolve(DetailViewFactoryInterface.self) else { return }
        let coordinator = DailyDetailCoordinator(viewModel: DailyDetailViewModel(factory: factory, data: data))
        start(coordinator: coordinator)
        
        navigationController.present(coordinator.viewContoller, animated: true, completion: nil)
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

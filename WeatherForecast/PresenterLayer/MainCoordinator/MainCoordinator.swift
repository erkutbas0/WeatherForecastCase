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
//        viewModel.subscribeDetailPageNavigation { [weak self](product) in
//            self?.goToDetailCoordinator(data: product)
//        }.disposed(by: disposeBag)
    }
    
//    private func goToDetailCoordinator(data: Product?) {
//        guard let product = data else { return }
//        let coordinator = ProductDetailCoordinator(viewModel: ProductDetailViewModel(product: product))
//        start(coordinator: coordinator)
//
//        self.navigationController.pushViewController(coordinator.viewContoller, animated: true)
//    }
    
    deinit {
        print("DEINIT MainCoordinator")
    }
    
}

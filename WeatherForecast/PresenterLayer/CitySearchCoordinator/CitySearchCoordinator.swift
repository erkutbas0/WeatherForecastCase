//
//  CitySearchCoordinator.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class CitySearchCoordinator: BaseCoordinator<CitySearchViewModel> {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        self.viewContoller = CitySearchViewController(viewModel: viewModel)
        self.viewContoller.modalPresentationStyle = .overFullScreen
        subscribeForFurtherCoordinators()
    }
    
    private func subscribeForFurtherCoordinators() {
        let result = viewModel.subscribeDismissProcess { [weak self] in
            self?.terminateCoordinator()
        }
        result?.disposed(by: disposeBag)
        
        let detailFlow = viewModel.subscribeDetailFlow { [weak self](data) in
            self?.fireDetailCoordinator(data: data)
        }
        detailFlow.disposed(by: disposeBag)
    }
    
    private func terminateCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    private func fireDetailCoordinator(data: WeatherDailyForecastResponse) {
        guard let factory = AssemblerResolver.resolve(DetailViewFactoryInterface.self) else { return }
        let coordinator = DailyDetailCoordinator(viewModel: DailyDetailViewModel(factory: factory, data: data))
        coordinator.subscribeTerminaterPublisher(completion: onDismissedListener).disposed(by: disposeBag)
        start(coordinator: coordinator)
        
        self.viewContoller.present(coordinator.viewContoller, animated: true, completion: nil)
    }
    
    private lazy var onDismissedListener: OnDismissed = { [weak self] in
        self?.viewContoller.dismiss(animated: true, completion: nil)
        self?.terminateCoordinator()
    }
    
}

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
        
        let detailFlow = viewModel.subscribeDetailFlow { [weak self] in
            self?.fireDetailCoordinator()
        }
        detailFlow.disposed(by: disposeBag)
    }
    
    private func terminateCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    private func fireDetailCoordinator() {
        let detail = DailyDetailCoordinator(viewModel: DailyDetailViewModel())
        start(coordinator: detail)
        
        self.viewContoller.present(detail.viewContoller, animated: true, completion: nil)
    }
    
    deinit {
        print("DEINIT CitySearchCoordinator")
    }
    
}

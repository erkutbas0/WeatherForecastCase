//
//  DailyDetailCoordinator.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class DailyDetailCoordinator: BaseCoordinator<DailyDetailViewModel> {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        self.viewContoller = DailyDetailViewController(viewModel: viewModel)
        self.viewContoller.modalPresentationStyle = .overFullScreen
//        subscribeForFurtherCoordinators()
    }
    
    private func subscribeForFurtherCoordinators() {
        let result = viewModel.subscribeDismissProcess { [weak self] in
            self?.terminateCoordinator()
        }
        result?.disposed(by: disposeBag)
    }
    
    private func terminateCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    deinit {
        print("DEINIT DailyDetailCoordinator")
    }
    
}

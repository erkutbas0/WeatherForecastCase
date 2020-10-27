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
    
    private var terminaterPublisher = PublishSubject<Void>()
    
    override func start() {
        self.viewContoller = DailyDetailViewController(viewModel: viewModel)
        self.viewContoller.modalPresentationStyle = .overFullScreen
        subscribeForFurtherCoordinators()
    }
    
    private func subscribeForFurtherCoordinators() {
        let result = viewModel.subscribeDismissProcess { [weak self] in
            self?.terminateCoordinator()
        }
        result?.disposed(by: disposeBag)
    }
    
    private func terminateCoordinator() {
        terminaterPublisher.onNext(())
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    func subscribeTerminaterPublisher(completion: @escaping OnDismissed) -> Disposable {
        return terminaterPublisher.subscribe(onNext: completion)
    }
    
    deinit {
        print("DEINIT DailyDetailCoordinator")
    }
    
}

//
//  MainCoordinatorObserverManager.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation
import RxSwift

class MainCoordinatorObserverManager {
    
    private let cityListRefreshPublisher = PublishSubject<Void>()
    
    func subscriberCityListRefreshPublisher(completion: @escaping () -> Void) -> Disposable {
        return cityListRefreshPublisher.subscribe(onNext: completion)
    }
    
    func informCityListPublisher() {
        cityListRefreshPublisher.onNext(())
    }
}

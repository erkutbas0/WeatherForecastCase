//
//  NetworkConnectionManager.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import Alamofire
import RxSwift

class NetworkConnectionManager {
    
    private let disposeBag = DisposeBag()
    
    private let manager = NetworkReachabilityManager()
    
    private let networkManagerSubject = PublishSubject<NetworkReachabilityManager.NetworkReachabilityStatus>()
    
    var didNetworkReachabilityChanges: Observable<NetworkReachabilityManager.NetworkReachabilityStatus> {
        return networkManagerSubject.asObservable()
    }
    
    init() {
        guard let manager = manager else { return }
        manager.startListening { [weak self] (networkStatus) in
            self?.networkManagerSubject.onNext(networkStatus)
        }
    }
    
}

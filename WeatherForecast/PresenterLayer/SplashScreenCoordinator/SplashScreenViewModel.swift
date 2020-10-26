//
//  SplashScreenViewModel.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxCocoa
import RxSwift

class SplashScreenViewModel: BaseViewModelDelegate {

    private var splashFinalize = BehaviorRelay<Bool>(value: false)
    
    /// Description: This module could be used to get app configuration files,
    /// app initialize process or application session management etc
    func startSplashProcess() {
        
        /*
         let's inform to move forward
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.fireSplashProcessFinish()
        }
    }
    
    func subscribeSplashProcess(completion: @escaping OnCompletedBool) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
    
    func fireSplashProcessFinish() {
        splashFinalize.accept(true)
    }
    
    func dismissCoordinator() {
        
    }
    
    deinit {
        print("DEINIT SplashScreenViewModel")
    }
    
}

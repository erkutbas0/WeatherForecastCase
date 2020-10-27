//
//  BaseUseCase.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxSwift

class BaseUseCase<P, T>: BaseUseCaseInterface {
    
    private let disposeBag = DisposeBag()
    
    typealias Parameters = P
    typealias Responses = T
    
    func generateUseCase(parameter: P) -> T? {
        return nil
    }
    
    func addDisposable(disposable: Disposable?) {
        guard disposable != nil else {
            return
        }
        disposeBag.insert(disposable!)

    }
    
}

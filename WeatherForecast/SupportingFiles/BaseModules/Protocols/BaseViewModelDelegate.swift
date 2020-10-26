//
//  BaseViewModelDelegate.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxSwift

public protocol BaseViewModelDelegate: AnyObject {
    
    var dismissInformer: PublishSubject<Void>? { get }
    //func dismissCoordinator()
    
}

extension BaseViewModelDelegate {
    func dismissCoordinator() {
        dismissInformer?.onNext(())
    }
    
    func subscribeDismissProcess(_ completion: @escaping OnDismissed) -> Disposable? {
        return dismissInformer?.subscribe(onNext: completion)
    }
}

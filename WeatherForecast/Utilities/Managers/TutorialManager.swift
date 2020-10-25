//
//  TutorialManager.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxSwift

class TutorialManager {
    
    private let signInPublishSubject = PublishSubject<()>()
    private let loginPublishSubject = PublishSubject<()>()
    private let continueWithoutRegistrationPublishSubject = PublishSubject<Void>()
    
    var didSignInButtonTapped: Observable<Void> {
        return signInPublishSubject.asObservable()
    }
    
    var didLoginButtonTapped: Observable<Void> {
        return loginPublishSubject.asObservable()
    }
    
    func signInProcessTrigger() {
        signInPublishSubject.onNext(Void())
    }
    
    func loginProcessTrigger() {
        loginPublishSubject.onNext(Void())
    }
    
    func subscribeContinueWithoutRegistration(completion: @escaping VoidOperation) -> Disposable {
        return continueWithoutRegistrationPublishSubject.subscribe(onNext: completion)
    }
    
    func mainProcessTrigger() {
        continueWithoutRegistrationPublishSubject.onNext(())
    }
    
}

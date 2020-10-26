//
//  AppViewModel.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxSwift

class AppViewModel: BaseViewModelDelegate {
    
    var dismissInformer: PublishSubject<Void>?
    
    deinit {
        print("DEINIT AppViewModel)")
    }

}

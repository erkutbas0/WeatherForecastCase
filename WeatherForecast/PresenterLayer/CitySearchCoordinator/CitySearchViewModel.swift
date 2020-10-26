//
//  CitySearchViewModel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

class CitySearchViewModel: BaseViewModelDelegate {

    var dismissInformer: PublishSubject<Void>? = PublishSubject<Void>()
    private var fireDetailFlow = PublishSubject<Void>()
    
    private var dailyUsecase: WeatherDailyForecastUseCase!
    private var dailyUsecaseCallback = WeatherDailyForecastCallBack()
    public var factory: CitySearchViewFactoryInterface!
    
    init(dailyUsecase: WeatherDailyForecastUseCase, factory: CitySearchViewFactoryInterface) {
        self.dailyUsecase = dailyUsecase
        self.factory = factory
    }

    func getDailyForecastData(textFieldsData: (String, Int)) {
        dailyUsecaseCallback.commonResult { [weak self](result) in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let data):
                print("data : \(data)")
                self?.fireDetailFlow.onNext(())
            }
        }
        dailyUsecase.execute(useCaseCallBack: dailyUsecaseCallback, params: factory.returnWeatherDailyForecastRequest(textFieldsData: textFieldsData))
    }
    
    func subscribeDetailFlow(_ completion: @escaping () -> Void) -> Disposable {
        return fireDetailFlow.subscribe(onNext: completion)
    }
    
    deinit {
        print("DEINIT CitySearchViewModel")
    }
    
}

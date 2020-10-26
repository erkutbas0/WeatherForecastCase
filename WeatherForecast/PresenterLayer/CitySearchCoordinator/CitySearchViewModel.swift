//
//  CitySearchViewModel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

typealias DailyForecastResultClosure = (Result<WeatherDailyForecastResponse, ErrorResponse>) -> Void
typealias DailyForecastResponseClosure = (WeatherDailyForecastResponse) -> Void

class CitySearchViewModel: BaseViewModelDelegate {

    var dismissInformer: PublishSubject<Void>? = PublishSubject<Void>()
    private var fireDetailFlow = PublishSubject<WeatherDailyForecastResponse>()
    
    private var dailyUsecase: WeatherDailyForecastUseCase!
    private var dailyUsecaseCallback = WeatherDailyForecastCallBack()
    public var factory: CitySearchViewFactoryInterface!
    
    init(dailyUsecase: WeatherDailyForecastUseCase, factory: CitySearchViewFactoryInterface) {
        self.dailyUsecase = dailyUsecase
        self.factory = factory
    }

    func getDailyForecastData(textFieldsData: (String, Int)) {
        dailyUsecaseCallback.commonResult(completion: callBackListener)
        dailyUsecase.execute(useCaseCallBack: dailyUsecaseCallback, params: factory.returnWeatherDailyForecastRequest(textFieldsData: textFieldsData))
    }
    
    private lazy var callBackListener: DailyForecastResultClosure = { [weak self] result in
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let data):
            self?.fireDetailFlow.onNext(data)
        }
    }
    
    func subscribeDetailFlow(_ completion: @escaping DailyForecastResponseClosure) -> Disposable {
        return fireDetailFlow.subscribe(onNext: completion)
    }
    
    deinit {
        print("DEINIT CitySearchViewModel")
    }
    
}

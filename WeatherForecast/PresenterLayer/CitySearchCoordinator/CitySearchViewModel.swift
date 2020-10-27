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
typealias ErrorPublishClosure = (CustomAlertData) -> Void

class CitySearchViewModel: BaseViewModelDelegate {
    
    // Mark: - Publishers -
    var activityStatePublisher: PublishSubject<ActivityStates>? = PublishSubject<ActivityStates>()
    var dismissInformer: PublishSubject<Void>? = PublishSubject<Void>()
    var errorPublisher: PublishSubject<CustomAlertData>? = PublishSubject<CustomAlertData>()
    private var fireDetailFlow = PublishSubject<WeatherDailyForecastResponse>()

    // Mark: - Viewmodel Properties -
    private var coreDataOperator: WeatherForecastCoreDataManagerInterface!
    private var observerManager: MainCoordinatorObserverManager!
    private var dailyUsecase: WeatherDailyForecastUseCase!
    private var dailyUsecaseCallback = WeatherDailyForecastCallBack()

    public var factory: CitySearchViewFactoryInterface!
    
    init(dailyUsecase: WeatherDailyForecastUseCase, factory: CitySearchViewFactoryInterface, coreDataOperator: WeatherForecastCoreDataManagerInterface, observerManager: MainCoordinatorObserverManager) {
        self.dailyUsecase = dailyUsecase
        self.factory = factory
        self.coreDataOperator = coreDataOperator
        self.observerManager = observerManager
    }

    func getDailyForecastData(textFieldsData: (String, Int)) {
        updateActivityState(by: .active)
        dailyUsecaseCallback.commonResult(completion: callBackListener)
        dailyUsecase.execute(useCaseCallBack: dailyUsecaseCallback, params: factory.returnWeatherDailyForecastRequest(textFieldsData: textFieldsData))
    }
    
    private lazy var callBackListener: DailyForecastResultClosure = { [weak self] result in
        self?.updateActivityState(by: .passive)
        switch result {
        case .failure(let error):
            self?.errorPublisher?.onNext(CustomAlertData(message: error.serverResponse?.message))
        case .success(let data):
            self?.fireDetailFlowAndRegisterTheCity(data: data)
        }
    }
    
    private func fireDetailFlowAndRegisterTheCity(data: WeatherDailyForecastResponse) {
        fireDetailFlow.onNext(data)
        
        guard let city = data.city, let id = city.id, let name = city.name else { return }
        coreDataOperator.saveToCoreData(id: id, name: name)
        
        observerManager.informCityListPublisher()

    }
    
    func subscribeDetailFlow(_ completion: @escaping DailyForecastResponseClosure) -> Disposable {
        return fireDetailFlow.subscribe(onNext: completion)
    }
    
}

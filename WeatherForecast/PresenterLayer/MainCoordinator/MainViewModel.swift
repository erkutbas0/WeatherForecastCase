//
//  MainViewModel.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation
import RxSwift

typealias FireCitySearchCompletion = () -> Void
typealias FireDailyForecastCompletion = (String) -> Void

class MainViewModel: BaseViewModelDelegate {
    
    private let disposeBag = DisposeBag()

    var dismissInformer: PublishSubject<Void>?
    private var dataState = PublishSubject<DataLoadingState>()
    
    private let fireCitySearh = PublishSubject<Void>()
    private let fireDailyForecast = PublishSubject<String>()
    
    public var factory: MainViewFactoryBuilderInterface!
    private var observerManager: MainCoordinatorObserverManager!
    private var coreDataOperator: WeatherForecastCoreDataManagerInterface!

    private var dailyForecastUsecase: WeatherDailyForecastUseCase!
    private var dailyForecastCallBack = WeatherDailyForecastCallBack()
    private var forecastUseCase: WeatherGroupForecastUseCase!
    private let forecastCallBack = WeatherGroupForecastCallBack()

    private var data: Array<CityWeatherInfoViewComponentData>? {
        didSet {
            setDataLoadingState(with: .loaded)
        }
    }
    
    init(coreDataOperator: WeatherForecastCoreDataManagerInterface!, forecastUseCase: WeatherGroupForecastUseCase, dailyForecastUsecase: WeatherDailyForecastUseCase!, factory: MainViewFactoryBuilderInterface, observerManager: MainCoordinatorObserverManager) {
        self.coreDataOperator = coreDataOperator
        self.forecastUseCase = forecastUseCase
        self.factory = factory
        self.observerManager = observerManager
        self.dailyForecastUsecase = dailyForecastUsecase
        
        subsribeObserverManager()
    }
    
    private func subsribeObserverManager() {
        observerManager.subscriberCityListRefreshPublisher { [weak self] in
            self?.getWeatherGroupForecastData()
        }.disposed(by: disposeBag)
    }
    
    // Mark: - Usecase flows -
    func getWeatherGroupForecastData() {
        let registeredCityList = coreDataOperator.getRegisteredCityList()
        
        if registeredCityList.isEmpty {
            fireCitySearch()
        } else {
            data = factory.returnCityWeatherInfoViewComponentData(data: registeredCityList)
            getCurrentGroupWeatherForecast(data: registeredCityList)
        }
    }
    
    func getDailyForecastData(cityId: Int64) {
        dailyForecastCallBack.commonResult(completion: dailyCallBackListener)
        dailyForecastUsecase.execute(useCaseCallBack: dailyForecastCallBack, params: WeatherDailyForecastRequest(cityId: cityId, dailyCount: 10))
    }
    
    private lazy var dailyCallBackListener: (Result<WeatherDailyForecastResponse, ErrorResponse>) -> Void = { [weak self] result in
        switch result {
        case .failure(let error):
            print("error \(error)")
        case .success(let data):
            print("data : \(data)")
            
        }
    }
    
    private func getCurrentGroupWeatherForecast(data: Array<RegisteredCityList>) {
        forecastCallBack.commonResult(completion: callBackListener)
        forecastUseCase.execute(useCaseCallBack: forecastCallBack, params: WeatherGroupForecastRequest(cityIds: factory.returnGroupWeatherQueryData(data: data)))
    }
    
    private lazy var callBackListener: (Result<WeatherGroupForecastResponse, ErrorResponse>) -> Void = { [weak self] result in
        switch result {
        case .failure(let error):
            print("error \(error)")
        case .success(let data):
            print("data : \(data)")
            self?.data = self?.factory.returnCityWeatherInfoViewComponentData(data: data)
        }
    }
    
    func subscribeDataLoadingProcess(completion: @escaping DataLoadingStateCompletion) -> Disposable {
        return dataState.subscribe(onNext: completion)
    }
    
    private func setDataLoadingState(with value: DataLoadingState) {
        dataState.onNext(value)
    }
    
    // Mark: - CitySearch Process Flow Methods -
    func fireCitySearch() {
        fireCitySearh.onNext(())
    }
    
    func subscribeFireCitySearch(completion: @escaping FireCitySearchCompletion) -> Disposable {
        return fireCitySearh.subscribe(onNext: completion)
    }
    
    // Mark: - City List View Component Data Requesters -
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItems(in section: Int) -> Int {
        guard let data = data else { return 0 }
        return data.count
    }
    
    func getCityItem(at index: Int) -> GenericRowDataProtocol? {
        guard let data = data else { return nil }
        return data[index]
    }
    
    deinit {
        print("DEINIT MainViewModel")
    }
}

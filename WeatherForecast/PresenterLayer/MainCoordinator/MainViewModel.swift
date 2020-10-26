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

    var dismissInformer: PublishSubject<Void>?
    
    private let fireCitySearh = PublishSubject<Void>()
    private let fireDailyForecast = PublishSubject<String>()
    
    private var coreDataManager: CoreDataManager!
    private var forecastUseCase: WeatherGroupForecastUseCase!
    public var factory: MainViewFactoryBuilderInterface!
    
    private let forecastCallBack = WeatherGroupForecastCallBack()
    
    init(coreDataManager: CoreDataManager, forecastUseCase: WeatherGroupForecastUseCase, factory: MainViewFactoryBuilderInterface) {
        self.coreDataManager = coreDataManager
        self.forecastUseCase = forecastUseCase
        self.factory = factory
    }
    
    func getWeatherGroupForecastData() {
        
        checkRegisteredCities()
        
//        forecastCallBack.commonResult { [weak self](result) in
//            switch result {
//            case .failure(let error):
//                print("error :\(error)")
//            case .success(let data):
//                print("data :\(data)")
//            }
//        }
//        
//        forecastUseCase.execute(useCaseCallBack: forecastCallBack, params: WeatherGroupForecastRequest(cityIds: "745042,323786,5128581,5109177"))
        
    }
    
    private func checkRegisteredCities() {
        let data = coreDataManager.fetch(RegisteredCityList.self)
        print(data.count)
        
        if data.isEmpty {
            fireCitySearch()
        }
    }
    
    func fireCitySearch() {
        fireCitySearh.onNext(())
    }
    
    func subscribeFireCitySearch(completion: @escaping FireCitySearchCompletion) -> Disposable {
        return fireCitySearh.subscribe(onNext: completion)
    }
    
    func dismissCoordinator() {
        
    }
    
    deinit {
        print("DEINIT MainViewModel")
    }
}

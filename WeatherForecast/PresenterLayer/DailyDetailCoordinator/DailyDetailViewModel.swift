//
//  DailyDetailViewModel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

import RxSwift

class DailyDetailViewModel: BaseViewModelDelegate {

    var dismissInformer: PublishSubject<Void>? = PublishSubject<Void>()
    
    public var factory: DetailViewFactoryInterface!
    private var data: WeatherDailyForecastResponse?
    
    init(factory: DetailViewFactoryInterface, data: WeatherDailyForecastResponse) {
        self.factory = factory
        self.data = data
    }
    
    func getDailyForecastDetailViewComponentData() -> DailyForecastDetailViewComponentData? {
        guard let data = data else { return nil}
        return factory.returnDailyForecastDetailViewComponentData(response: data)
    }
    
//    private var dailyUsecase: WeatherDailyForecastUseCase!
//    private var dailyUsecaseCallback = WeatherDailyForecastCallBack()
//    public var factory: CitySearchViewFactoryInterface!
//
//    init(dailyUsecase: WeatherDailyForecastUseCase, factory: CitySearchViewFactoryInterface) {
//        self.dailyUsecase = dailyUsecase
//        self.factory = factory
//    }
//
//    func getDailyForecastData(textFieldsData: (String, Int)) {
//        dailyUsecaseCallback.commonResult { [weak self](result) in
//            switch result {
//            case .failure(let error):
//                print("error : \(error)")
//            case .success(let data):
//                print("data : \(data)")
//            }
//        }
//        dailyUsecase.execute(useCaseCallBack: dailyUsecaseCallback, params: factory.returnWeatherDailyForecastRequest(textFieldsData: textFieldsData))
//    }
    
    deinit {
        print("DEINIT DailyDetailViewModel")
    }
    
}

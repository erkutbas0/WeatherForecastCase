//
//  DailyDetailViewModel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

import RxSwift

class DailyDetailViewModel: BaseViewModelDelegate {

    var errorPublisher: PublishSubject<CustomAlertData>?
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
    
    func returnNumberOfSection() -> Int {
        return 1
    }
    
    func returnNumberOfItems(in section: Int) -> Int {
        guard let data = data, let list = data.list else { return 0 }
        return list.count
    }
    
    func returnDataItem(at index: Int) -> GenericDataProtocol? {
        guard let data = data, let list = data.list, let item = list.getElement(at: index) else { return nil }
        return factory.returnDailyInfoViewData(data: item, timeZone: data.city?.timezone ?? 10800)
    }

    deinit {
        print("DEINIT DailyDetailViewModel")
    }
    
}

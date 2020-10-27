//
//  CitySearchViewFactoryInterface.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

protocol CitySearchViewFactoryInterface {
    func returnHeaderViewComponentData() -> HeaderViewComponentData
    func returnActionButtonViewComponentData() -> ActionButtonViewComponentData
    func returnWeatherDailyForecastRequest(textFieldsData: (String, Int)) -> WeatherDailyForecastRequest
    func returnFilterViewComponentData() -> FilterViewComponentData
}

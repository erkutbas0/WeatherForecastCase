//
//  DetailViewFactoryInterface.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

protocol DetailViewFactoryInterface {
    func returnDailyForecastDetailViewComponentData(response: WeatherDailyForecastResponse) -> DailyForecastDetailViewComponentData?
}

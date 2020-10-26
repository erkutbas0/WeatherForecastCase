//
//  MainRouter.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

protocol MainRouter {
    func fireCitySearchFlow()
    func fireDailyForecastFlow(itemId: String)
}

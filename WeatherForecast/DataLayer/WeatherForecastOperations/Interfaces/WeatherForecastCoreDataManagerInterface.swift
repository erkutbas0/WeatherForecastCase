//
//  WeatherForecastCoreDataManagerInterface.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation

protocol WeatherForecastCoreDataManagerInterface {
    func saveToCoreData(id: Int64, name: String)
    func getRegisteredCityList() -> Array<RegisteredCityList>
    func removeFromCoreData(id: Int64)
}

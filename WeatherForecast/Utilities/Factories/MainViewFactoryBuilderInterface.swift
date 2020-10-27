//
//  MainViewFactoryBuilderInterface.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

protocol MainViewFactoryBuilderInterface {
    
    func returnHeaderViewComponentData() -> HeaderViewComponentData
    func returnCityWeatherInfoViewComponentData(data: Array<RegisteredCityList>) -> Array<CityWeatherInfoViewComponentData>?
    func returnCityWeatherInfoViewComponentData(data: WeatherGroupForecastResponse) -> Array<CityWeatherInfoViewComponentData>?
    func returnGroupWeatherQueryData(data: Array<RegisteredCityList>) -> String
    func removeCityFromData(cityId: Int64, data: inout Array<CityWeatherInfoViewComponentData>)
    
}

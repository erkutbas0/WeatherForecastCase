//
//  DailyForecastDetailViewComponentDelegate.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

protocol DailyForecastDetailViewComponentDelegate: AnyObject {
    func numberOfSection() -> Int
    func numberOfItems(in section: Int) -> Int
    func getItemData(at index: Int) -> GenericDataProtocol?
}

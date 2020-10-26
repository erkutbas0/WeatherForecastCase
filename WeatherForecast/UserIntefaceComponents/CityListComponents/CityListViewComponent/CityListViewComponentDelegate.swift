//
//  CityListViewComponentDelegate.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

protocol CityListViewComponentDelegate: AnyObject {
    func getNumberOfItems(in section: Int) -> Int
    func getNumberOfSections() -> Int
    func getCityItem(by index: Int) -> GenericRowDataProtocol?
}

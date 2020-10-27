//
//  DetailInfoViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation

class DetailInfoViewComponentData {
    
    private(set) var cityName: BasicAttributedLabelData
    private(set) var weatherMainInfo: BasicAttributedLabelData
    
    init(cityName: BasicAttributedLabelData, weatherMainInfo: BasicAttributedLabelData) {
        self.cityName = cityName
        self.weatherMainInfo = weatherMainInfo
    }
    
    
}

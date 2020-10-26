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
    private(set) var degreeInfo: TempratureViewComponentData
    private(set) var tempDetail: TempratureDetailComponentData
    
    init(cityName: BasicAttributedLabelData, weatherMainInfo: BasicAttributedLabelData, degreeInfo: TempratureViewComponentData, tempDetail: TempratureDetailComponentData) {
        self.cityName = cityName
        self.weatherMainInfo = weatherMainInfo
        self.degreeInfo = degreeInfo
        self.tempDetail = tempDetail
    }
    
    
}

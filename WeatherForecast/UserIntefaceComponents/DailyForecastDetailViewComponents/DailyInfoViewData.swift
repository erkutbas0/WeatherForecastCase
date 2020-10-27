//
//  DailyInfoViewData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation

class DailyInfoViewData: GenericDataProtocol {
    
    private(set) var dayText: BasicAttributedLabelData
    private(set) var iconUrl: CustomImageViewComponentData
    private(set) var tempratureData: TempratureDetailComponentData
    
    init(dayText: BasicAttributedLabelData, iconUrl: CustomImageViewComponentData, tempratureData: TempratureDetailComponentData) {
        self.dayText = dayText
        self.iconUrl = iconUrl
        self.tempratureData = tempratureData
    }
    
}

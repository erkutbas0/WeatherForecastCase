//
//  TitleInfoViewComponenData.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class TitleInfoViewComponentData {
    
    private(set) var timeInfo: BasicAttributedLabelData
    private(set) var cityName: BasicAttributedLabelData
    
    init(timeInfo: BasicAttributedLabelData, cityName: BasicAttributedLabelData) {
        self.timeInfo = timeInfo
        self.cityName = cityName
    }
    
}

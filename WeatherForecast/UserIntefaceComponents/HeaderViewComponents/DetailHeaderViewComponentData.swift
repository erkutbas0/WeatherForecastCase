//
//  DetailHeaderViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class DetailHeaderViewComponentData {
    
    private(set) var middleInfo: DetailInfoViewComponentData
    private(set) var leftIcon: ImageContainerData? = nil

    init(middleInfo: DetailInfoViewComponentData) {
        self.middleInfo = middleInfo
    }
    
    func setLeftIcon(by value: ImageContainerData) -> Self {
        self.leftIcon = value
        return self
    }
}

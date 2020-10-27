//
//  CityWeatherInfoViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class CityWeatherInfoViewComponentData: GenericRowDataProtocol {

    private(set) var itemId: Int64
    private(set) var titleInfo: TitleInfoViewComponentData
    private(set) var degreeValue: TempratureViewComponentData
    private(set) var backgroundImage: UIImage = VisualContents.clear.value
    
    init(itemId: Int64, titleInfo: TitleInfoViewComponentData, degreeValue: TempratureViewComponentData) {
        self.itemId = itemId
        self.titleInfo = titleInfo
        self.degreeValue = degreeValue
    }
    
    func setBackgroundImage(by value: UIImage) -> Self {
        self.backgroundImage = value
        return self
    }
    
}

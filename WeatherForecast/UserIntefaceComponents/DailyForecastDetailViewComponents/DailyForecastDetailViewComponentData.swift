//
//  DailyForecastDetailViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class DailyForecastDetailViewComponentData {
    
    private(set) var headerViewData: DetailHeaderViewComponentData
    private(set) var headerHeight: CGFloat = 300
    
    init(headerViewData: DetailHeaderViewComponentData) {
        self.headerViewData = headerViewData
    }
    
    func setHeaderHeight(by value: CGFloat) -> Self {
        self.headerHeight = value
        return self
    }
    
}

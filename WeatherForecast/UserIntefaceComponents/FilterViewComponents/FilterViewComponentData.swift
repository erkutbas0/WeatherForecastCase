//
//  FilterViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class FilterViewComponentData {
    
    private(set) var cityTextData: TextFieldContainerData = TextFieldContainerData(placeHolder: CitySearchViewLocalizables.cityPlaceHolder.value)
    private(set) var dailyCountData: TextFieldContainerData = TextFieldContainerData(placeHolder: CitySearchViewLocalizables.dailyCountPlaceHolder.value)
    private(set) var pickerCount: Int = 16
    
    func setCityTextData(by value: TextFieldContainerData) -> Self {
        self.cityTextData = value
        return self
    }
    
    func setDailyCountData(by value: TextFieldContainerData) -> Self {
        self.dailyCountData = value
        return self
    }
    
    func setPickerCount(by value: Int) -> Self {
        self.pickerCount = value
        return self
    }
    
}

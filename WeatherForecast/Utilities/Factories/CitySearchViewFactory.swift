//
//  CitySearchViewFactory.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class CitySearchViewFactory: CitySearchViewFactoryInterface {
    
    func returnHeaderViewComponentData() -> HeaderViewComponentData {
        
        let imageContainerData = ImageContainerData()
            .setImage(with: VisualContents.closeIcon.value)
            .setWidth(with: 16).setHeight(with: 16)
            .setTintColor(with: ColorSpectrum.darkTheme)
        
        let title = BasicAttributedLabelData(text: CitySearchViewLocalizables.headerTitle.value)
            .setTextColor(with: [ColorSpectrum.darkTheme])
            .setTextFont(with: [SourceSansPro.SemiBold(40).value])
        
        return HeaderViewComponentData(title: title)
            .setTheme(by: .light)
            .setLeftIcon(by: imageContainerData).setShadowAlpha(by: 0.5)
    }
    
    func returnActionButtonViewComponentData() -> ActionButtonViewComponentData {
        let title = BasicAttributedLabelData(text: CitySearchViewLocalizables.buttonContinue.value)
            .setTextColor(with: [ColorSpectrum.defaultWhite])
            .setTextFont(with: [SourceSansPro.SemiBold(16).value])
        
        return ActionButtonViewComponentData(title: title)
    }
    
    func returnWeatherDailyForecastRequest(textFieldsData: (String, Int)) -> WeatherDailyForecastRequest {
        return WeatherDailyForecastRequest(queryCity: textFieldsData.0, dailyCount: textFieldsData.1)
    }
    
    func returnFilterViewComponentData() -> FilterViewComponentData {
        return FilterViewComponentData()
    }
    
    
}

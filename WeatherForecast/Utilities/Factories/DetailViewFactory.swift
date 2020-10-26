//
//  DetailViewFactory.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation


class DetailViewFactory: DetailViewFactoryInterface {
    
    internal func returnDailyForecastDetailViewComponentData(response: WeatherDailyForecastResponse) -> DailyForecastDetailViewComponentData? {
        guard let weatherList = response.list, let item = weatherList.first else { return nil }
   
        let middleInfo = DetailInfoViewComponentData(cityName: BasicAttributedLabelData(text: response.city?.name), weatherMainInfo: BasicAttributedLabelData(text: item.weather?[0].main), degreeInfo: TempratureViewComponentData(value: item.temp?.day), tempDetail: TempratureDetailComponentData(highestValue: TempratureDetailLabelData(degreeText: DetailViewLocalizables.highestDegreePrefix.value, degreeValue: item.temp?.max), lowestValue: TempratureDetailLabelData(degreeText: DetailViewLocalizables.lowestDegreePrefix.value, degreeValue: item.temp?.min)))
        
        return DailyForecastDetailViewComponentData(headerViewData: DetailHeaderViewComponentData(middleInfo: middleInfo))
        
    }
    
}

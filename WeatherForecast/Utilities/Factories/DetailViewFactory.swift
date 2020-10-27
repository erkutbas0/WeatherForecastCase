//
//  DetailViewFactory.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation


class DetailViewFactory: DetailViewFactoryInterface {
    
    private let formatter = DateFormatterManager()
    
    internal func returnDailyForecastDetailViewComponentData(response: WeatherDailyForecastResponse) -> DailyForecastDetailViewComponentData? {
        guard let weatherList = response.list, let item = weatherList.first else { return nil }
   
        let imageContainerData = ImageContainerData()
            .setImage(with: VisualContents.closeIcon.value)
            .setWidth(with: 16).setHeight(with: 16)
            .setTintColor(with: ColorSpectrum.darkTheme)
        
        let middleInfo = DetailInfoViewComponentData(cityName: BasicAttributedLabelData(text: response.city?.name).setTextFont(with: [SourceSansPro.SemiBold(30).value]).setTextAlignment(with: .center).setTextColor(with: [ColorSpectrum.darkTheme]), weatherMainInfo: BasicAttributedLabelData(text: item.weather?[0].main).setTextFont(with: [SourceSansPro.Regular(14).value]).setTextAlignment(with: .center).setTextColor(with: [ColorSpectrum.darkTheme]))
        
        let bottomInfo = DetailDegreeInfoComponentData(degreeInfo: TempratureViewComponentData(value: item.temp?.day).setTextFont(with: [SourceSansPro.SemiBold(72).value]).setTextAlignment(with: .center).setTextColor(with: [ColorSpectrum.darkTheme]), tempDetail: TempratureDetailComponentData(highestValue: TempratureDetailLabelData(degreeText: DetailViewLocalizables.highestDegreePrefix.value, degreeValue: item.temp?.max).setTextAlignment(with: .center).setTextColor(with: [ColorSpectrum.darkTheme]), lowestValue: TempratureDetailLabelData(degreeText: DetailViewLocalizables.lowestDegreePrefix.value, degreeValue: item.temp?.min).setTextAlignment(with: .center).setTextColor(with: [ColorSpectrum.darkTheme])))
        
        return DailyForecastDetailViewComponentData(headerViewData: DetailHeaderViewComponentData(middleInfo: middleInfo, bottomInfo: bottomInfo).setLeftIcon(by: imageContainerData))
        
    }
    
    func returnDailyInfoViewData(data: WeatherDailyList, timeZone: Int) -> DailyInfoViewData? {

        guard let dt = data.dt, let formattedTime = formatter.getDailyFormat(time: TimeInterval(dt), timeZone: timeZone) else { return nil }
        guard let highest = data.temp?.max, let lowest = data.temp?.min else { return nil }
        guard let weather = data.weather?.getElement(at: 0), let icon = weather.icon else { return nil }
        
        let infoData = DailyInfoViewData(dayText: BasicAttributedLabelData(text: formattedTime).setTextColor(with: [ColorSpectrum.darkTheme]), iconUrl:  CustomImageViewComponentData(imageUrl: iconUrlGenerator(icon: icon)), tempratureData: TempratureDetailComponentData(highestValue: TempratureDetailLabelData(degreeText: DetailViewLocalizables.highestDegreePrefix.value, degreeValue: highest).setTextColor(with: [ColorSpectrum.darkTheme]).setTextAlignment(with: .right), lowestValue: TempratureDetailLabelData(degreeText: DetailViewLocalizables.lowestDegreePrefix.value, degreeValue: lowest).setTextColor(with: [ColorSpectrum.darkTheme]).setTextAlignment(with: .left)))
        
        return infoData
    }
    
    private func iconUrlGenerator(icon: String) -> String {
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
    
}

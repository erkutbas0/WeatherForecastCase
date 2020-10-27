//
//  MainViewFactoryBuilder.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class MainViewFactoryBuilder: MainViewFactoryBuilderInterface {
    
    private let dateFormatterManager = DateFormatterManager()

    func returnHeaderViewComponentData() -> HeaderViewComponentData {
        return HeaderViewComponentData(title: BasicAttributedLabelData(text: MainViewLocalizables.headerTitle.value).setTextFont(with: [SourceSansPro.SemiBold(40).value])).setRightIcon(by: ImageContainerData().setImage(with: VisualContents.searchIcon.value).setWidth(with: 40).setHeight(with: 40))
    }
    
    func returnCityWeatherInfoViewComponentData(data: Array<RegisteredCityList>) -> Array<CityWeatherInfoViewComponentData>? {

        return data.map { (entity) -> CityWeatherInfoViewComponentData in
            let newData = CityWeatherInfoViewComponentData(itemId: entity.cityId, titleInfo: TitleInfoViewComponentData(timeInfo: BasicAttributedLabelData(text: "00.00"), cityName: BasicAttributedLabelData(text: entity.name ?? "unknown").setTextFont(with: [SourceSansPro.SemiBold(32).value])), degreeValue: TempratureViewComponentData(value: 0).setTextFont(with: [SourceSansPro.SemiBold(64).value]))
            return newData
        }
        
    }
    
    func returnCityWeatherInfoViewComponentData(data: WeatherGroupForecastResponse) -> Array<CityWeatherInfoViewComponentData>? {
        guard let list = data.list else { return nil }
        
        return list.map { (weatherData) -> CityWeatherInfoViewComponentData in
            let newData = CityWeatherInfoViewComponentData(itemId: weatherData.id ?? 745042, titleInfo: TitleInfoViewComponentData(timeInfo: BasicAttributedLabelData(text: dateFormatterManager.getTimeFormat(time: TimeInterval(weatherData.dt ?? 0), timeZone: weatherData.sys?.timezone ?? 10800)), cityName: BasicAttributedLabelData(text: weatherData.name ?? "unknown").setTextFont(with: [SourceSansPro.SemiBold(32).value])), degreeValue: TempratureViewComponentData(value: weatherData.main?.feelsLike).setTextFont(with: [SourceSansPro.SemiBold(64).value])).setBackgroundImage(by: returnWeatherBackground(type: weatherData.weather?.getElement(at: 0)?.main ?? "clear"))
            return newData
        }
        
    }
    
    func returnGroupWeatherQueryData(data: Array<RegisteredCityList>) -> String {
        let result = data.map { (entity) -> String in
            return "\(entity.cityId)"
        }
        
        return result.joined(separator: ",")
    }
    
    private func returnWeatherBackground(type: String) -> UIImage {
        
        let weatherType = WeatherRowType.init(rawValue: type)
        
        switch weatherType {
        case .clear:
            return VisualContents.clear.value
        case .clouds:
            return VisualContents.cloud.value
        case .drizzle:
            return VisualContents.drizzle.value
        case .rain:
            return VisualContents.rain.value
        case .snow:
            return VisualContents.snow.value
        case .thunderstorm:
            return VisualContents.thunderstorm.value
        case .none:
            return VisualContents.clear.value
        }
        
    }
}

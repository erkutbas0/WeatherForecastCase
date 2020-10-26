//
//  CityWeatherInfoViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class CityWeatherInfoViewComponent: GenericBaseView<GenericRowDataProtocol> {
    
    lazy var backgroundImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    lazy var titleInfo: TitleInfoViewComponent = {
        let temp = TitleInfoViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var degreeValue: TempratureViewComponent = {
        let temp = TempratureViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addUserInterfaceComponents()
    }
    
    private func addUserInterfaceComponents() {
        addSubview(backgroundImageView)
        addSubview(titleInfo)
        addSubview(degreeValue)
        
        NSLayoutConstraint.activate([
        
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 90),
            
            titleInfo.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            degreeValue.centerYAnchor.constraint(equalTo: centerYAnchor),
            degreeValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
        ])
    }
}

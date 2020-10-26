//
//  CityWeatherInfoCell.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class CityWeatherInfoCell: GenericTableViewCell<GenericRowDataProtocol, CityWeatherInfoViewComponent>  {
    
    override func setupView() {
        super.setupView()
        setViewConfigurations()
    }
    
    private func setViewConfigurations() {
        backgroundColor = ColorSpectrum.defaultWhite
        contentView.backgroundColor = ColorSpectrum.defaultWhite
        contentView.layer.cornerRadius = 6
        contentView.layer.shadowColor = ColorSpectrum.darkTheme.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 0.4
        
    }
    
}

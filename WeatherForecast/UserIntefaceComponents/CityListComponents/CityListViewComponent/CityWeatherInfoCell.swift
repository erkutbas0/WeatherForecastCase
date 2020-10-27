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
        selectionStyle = .none
        
    }
    
}

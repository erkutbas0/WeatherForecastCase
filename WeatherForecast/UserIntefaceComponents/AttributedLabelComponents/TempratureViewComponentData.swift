//
//  TempratureViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class TempratureViewComponentData {
    
    private(set) var value: Double?
    private(set) var textColor: Array<UIColor> = [ColorSpectrum.defaultWhite]
    private(set) var textFont: Array<UIFont?> = [SourceSansPro.Regular(14).value]
    private(set) var textAlignment: NSTextAlignment = .left
    
    init(value: Double?) {
        self.value = value
    }
    
    func setTextColor(with value: Array<UIColor>) -> Self {
        self.textColor = value
        return self
    }
    
    func setTextFont(with value: Array<UIFont?>) -> Self {
        self.textFont = value
        return self
    }
    
    func setTextAlignment(with value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }
    
}

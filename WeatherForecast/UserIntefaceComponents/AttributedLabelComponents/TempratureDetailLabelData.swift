//
//  TempratureDetailLabelData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

class TempratureDetailLabelData {
    
    private(set) var degreeText: String?
    private(set) var degreeValue: Double?
    private(set) var textColor: Array<UIColor> = [ColorSpectrum.defaultWhite]
    private(set) var textFont: Array<UIFont?> = [SourceSansPro.Regular(14).value]
    private(set) var textAlignment: NSTextAlignment = .left
    
    init(degreeText: String?, degreeValue: Double?) {
        self.degreeText = degreeText
        self.degreeValue = degreeValue
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

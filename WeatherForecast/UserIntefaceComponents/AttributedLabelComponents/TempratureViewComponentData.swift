//
//  TempratureViewComponentData.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class TempratureViewComponentData {
    
    private(set) var text: String
    private(set) var textColor: Array<UIColor> = [ColorSpectrum.defaultWhite]
    private(set) var textFont: Array<UIFont?> = [SourceSansPro.Regular(14).value]
    private(set) var textAlignment: NSTextAlignment = .left
    
    init(text: String) {
        self.text = text
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

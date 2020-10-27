//
//  TextFieldContainerData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

class TextFieldContainerData {
    private(set) var placeHolder: String
    private(set) var titleTextColor: UIColor = ColorSpectrum.darkTheme
    private(set) var keyboardType: UIKeyboardType = .alphabet
    
    init(placeHolder: String) {
        self.placeHolder = placeHolder
    }
    
    func setTitleTextColor(by value: UIColor) -> Self {
        self.titleTextColor = value
        return self
    }
    
    func setKeyboardType(by value: UIKeyboardType) -> Self {
        self.keyboardType = value
        return self
    }
    
}

//
//  ActionButtonViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class ActionButtonViewComponentData {
    
    private(set) var title: BasicAttributedLabelData
    private(set) var backgroundColor: UIColor = ColorSpectrum.turquioseBackground
    
    init(title: BasicAttributedLabelData) {
        self.title = title
    }
    
    func setBackgroundColor(by value: UIColor) -> Self {
        self.backgroundColor = value
        return self
    }
    
}

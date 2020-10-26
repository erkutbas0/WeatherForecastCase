//
//  HeaderViewComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 25.10.2020.
//

import UIKit

class HeaderViewComponentData {
    
    private(set) var title: BasicAttributedLabelData
    private(set) var theme: HeaderViewComponentTheme = .dark
    private(set) var leftIcon: ImageContainerData? = nil
    private(set) var rightIcon: ImageContainerData? = nil

    init(title: BasicAttributedLabelData) {
        self.title = title
    }
    
    func setTheme(by value: HeaderViewComponentTheme) -> Self {
        self.theme = value
        return self
    }
    
    func setLeftIcon(by value: ImageContainerData) -> Self {
        self.leftIcon = value
        return self
    }
    
    func setRightIcon(by value: ImageContainerData) -> Self {
        self.rightIcon = value
        return self
    }
    
}


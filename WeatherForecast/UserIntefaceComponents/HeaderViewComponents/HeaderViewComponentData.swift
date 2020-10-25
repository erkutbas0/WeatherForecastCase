//
//  HeaderViewComponentData.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import UIKit

class HeaderViewComponentData {
    
    private(set) var title: String
    private(set) var theme: HeaderViewComponentTheme = .dark
    private(set) var leftIcon: ImageContainerData? = nil
    private(set) var rightIcon: ImageContainerData? = nil

    init(title: String) {
        self.title = title
    }
    
}


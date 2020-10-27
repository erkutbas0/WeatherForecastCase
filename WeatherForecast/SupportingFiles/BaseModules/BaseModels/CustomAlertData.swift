//
//  CustomAlertData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation

public class CustomAlertData {
    private(set) var title: String = WarningLocalizables.warningTitle.value
    private(set) var message: String?
    
    public init(message: String?) {
        self.message = message
    }
    
    func setTitle(by value: String) -> Self {
        self.title = value
        return self
    }
}

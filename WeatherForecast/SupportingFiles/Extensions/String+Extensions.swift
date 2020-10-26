//
//  String+Extensions.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

// MARK: - String -
extension String {
    
    func toLocalize() -> String{
        return NSLocalizedString(self, comment: "")
    }
    
}

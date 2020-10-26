//
//  DynamicLabelDataProtocol.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

protocol DynamicLabelDataProtocol {
    var version: String { get }
}

extension DynamicLabelDataProtocol {
    func returnVersion() -> String {
        return version
    }
}

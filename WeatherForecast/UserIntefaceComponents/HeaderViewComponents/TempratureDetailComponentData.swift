//
//  TempratureDetailComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation

class TempratureDetailComponentData {
    
    private(set) var highestValue: TempratureDetailLabelData
    private(set) var lowestValue: TempratureDetailLabelData
    
    init(highestValue: TempratureDetailLabelData, lowestValue: TempratureDetailLabelData) {
        self.highestValue = highestValue
        self.lowestValue = lowestValue
    }
    
}

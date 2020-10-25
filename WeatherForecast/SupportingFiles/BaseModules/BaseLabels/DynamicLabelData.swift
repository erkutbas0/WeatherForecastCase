//
//  DynamicLabelData.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//
import Foundation

struct DynamicLabelData {
    
    var data: DynamicLabelProtocol
    
    init(data: DynamicLabelProtocol) {
        self.data = data
    }
    
}

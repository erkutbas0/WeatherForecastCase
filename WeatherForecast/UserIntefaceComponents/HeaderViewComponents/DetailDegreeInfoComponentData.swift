//
//  DetailDegreeInfoComponentData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation

class DetailDegreeInfoComponentData {
    
    private(set) var degreeInfo: TempratureViewComponentData
    private(set) var tempDetail: TempratureDetailComponentData
    
    init(degreeInfo: TempratureViewComponentData, tempDetail: TempratureDetailComponentData) {
        self.degreeInfo = degreeInfo
        self.tempDetail = tempDetail
    }
    
}

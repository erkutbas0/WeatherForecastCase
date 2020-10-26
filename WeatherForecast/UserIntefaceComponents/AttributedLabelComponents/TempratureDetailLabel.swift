//
//  TempratureDetailLabel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation

class TempratureDetailLabel: BaseDynamicAttributedLabel<TempratureDetailLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        guard let degreeText = data.degreeText, let degreeValue = data.degreeValue, let font = data.textFont[0] else { return }
        
        attributedText = NSMutableAttributedString(string: "\(degreeText): \(degreeValue)°", attributes: [.font : font, .foregroundColor: data.textColor[0]])
    }
    
}


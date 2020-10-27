//
//  TempratureDetailLabel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

class TempratureDetailLabel: BaseDynamicAttributedLabel<TempratureDetailLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        guard let degreeText = data.degreeText, let degreeValue = data.degreeValue, let font = data.textFont[0] else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = data.textAlignment
        
        attributedText = NSMutableAttributedString(string: "\(degreeText): \(Int(degreeValue))°", attributes: [.font : font, .foregroundColor: data.textColor[0], .paragraphStyle: paragraphStyle])
    }
    
}


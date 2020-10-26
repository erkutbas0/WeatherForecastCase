//
//  BasicAttributedLabel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 25.10.2020.
//

import Foundation

class BasicAttributedLabel: BaseDynamicAttributedLabel<BasicAttributedLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        guard let font = data.textFont[0] else { return }
        
        attributedText = NSMutableAttributedString(string: "\(data.text)", attributes: [.font : font, .foregroundColor: data.textColor[0]])
    }
    
}

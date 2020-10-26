//
//  TempratureViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class TempratureViewComponent: BaseDynamicAttributedLabel<TempratureViewComponentData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        guard let text = data.value, let font = data.textFont[0] else { return }
        
        attributedText = NSMutableAttributedString(string: "\(text)°", attributes: [.font : font, .foregroundColor: data.textColor[0]])
    }
    
}


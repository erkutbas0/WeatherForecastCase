//
//  TempratureViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class TempratureViewComponent: BaseDynamicAttributedLabel<TempratureViewComponentData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        guard let text = data.value, let font = data.textFont[0] else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = data.textAlignment
        
        attributedText = NSMutableAttributedString(string: "\(Int(text))°", attributes: [.font : font, .foregroundColor: data.textColor[0], .paragraphStyle: paragraphStyle])
    }
    
}


//
//  BasicAttributedLabel.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 25.10.2020.
//

import UIKit

class BasicAttributedLabel: BaseDynamicAttributedLabel<BasicAttributedLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        guard let text = data.text, let font = data.textFont[0] else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = data.textAlignment
        
        attributedText = NSMutableAttributedString(string: text, attributes: [.font : font, .foregroundColor: data.textColor[0], .paragraphStyle: paragraphStyle])
    }
    
}

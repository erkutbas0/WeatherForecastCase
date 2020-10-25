//
//  UIColor+Extension.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import UIKit

extension UIColor {
    
    convenience init(redVal: CGFloat, greenVal: CGFloat, blueVal: CGFloat, alphaVal: CGFloat) {
        self.init(red: redVal/255, green: greenVal/255, blue: blueVal/255, alpha: alphaVal)
    }
    
}

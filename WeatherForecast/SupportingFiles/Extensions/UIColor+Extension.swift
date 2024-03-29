//
//  UIColor+Extension.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//


import UIKit

extension UIColor {
    
    convenience init(redVal: CGFloat, greenVal: CGFloat, blueVal: CGFloat, alphaVal: CGFloat) {
        self.init(red: redVal/255, green: greenVal/255, blue: blueVal/255, alpha: alphaVal)
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int, alpha: CGFloat) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF, alpha: alpha)
    }
}

//
//  ColorSpectrum.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

public struct ColorSpectrum {
    
    public static var defaultBackground: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "DefaultBackground") {
                return color
            }
        }
        return UIColor(redVal: 255, greenVal: 255, blueVal: 255, alphaVal: 1)
    }
    
    public static var yellowColor: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "YellowColor") {
                return color
            }
        }
        return UIColor(redVal: 255, greenVal: 197, blueVal: 0, alphaVal: 1)
    }
    
}

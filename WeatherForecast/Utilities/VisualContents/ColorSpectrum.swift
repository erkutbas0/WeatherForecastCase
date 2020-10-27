//
//  ColorSpectrum.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

public struct ColorSpectrum {
    
    public static var darkTheme: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "DarkTheme") {
                return color
            }
        }
        return UIColor(redVal: 42, greenVal: 46, blueVal: 67, alphaVal: 1)
    }
    
    public static var defaultBackground: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "DefaultBackground") {
                return color
            }
        }
        return UIColor(redVal: 240, greenVal: 240, blueVal: 250, alphaVal: 1)
    }
    
    public static var defaultWhite: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "DefaultWhite") {
                return color
            }
        }
        return UIColor(redVal: 255, greenVal: 255, blueVal: 255, alphaVal: 1)
    }
    
    public static var turquioseBackground: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "TurquioseBackground") {
                return color
            }
        }
        return UIColor(redVal: 58, greenVal: 204, blueVal: 255, alphaVal: 1)
    }
    
    public static var redTheme: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "RedTheme") {
                return color
            }
        }
        return UIColor(redVal: 200, greenVal: 35, blueVal: 50, alphaVal: 1)
    }
    
}

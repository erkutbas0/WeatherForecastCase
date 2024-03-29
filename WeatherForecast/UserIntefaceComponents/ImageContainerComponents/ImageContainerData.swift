//
//  ImageContainerData.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 25.10.2020.
//
import UIKit

class ImageContainerData {
    
    private(set) var image: UIImage = VisualContents.closeIcon.value
    private(set) var height: CGFloat = 20
    private(set) var width: CGFloat = 20
    private(set) var tintColor: UIColor = ColorSpectrum.defaultWhite

    func setImage(with value: UIImage) -> Self {
        self.image = value
        return self
    }
    
    func setHeight(with value: CGFloat) -> Self {
        self.height = value
        return self
    }
    
    func setWidth(with value: CGFloat) -> Self {
        self.width = value
        return self
    }
    
    func setTintColor(with value: UIColor) -> Self {
        self.tintColor = value
        return self
    }
    
}

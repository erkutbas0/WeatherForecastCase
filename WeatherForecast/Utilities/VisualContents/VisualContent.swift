//
//  VisualContent.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import UIKit

public enum VisualContents: GenericDescriptorProtocol {
    
    case gradientLayer
    
    typealias Value = UIImage
    
    var value: UIImage {
        switch self {
        case .gradientLayer:
            return UIImage(imageLiteralResourceName: "GradientLayer")
        }
    }
    
}

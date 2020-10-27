//
//  VisualContent.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import UIKit

public enum VisualContents: GenericValueProtocol {
    
    case searchIcon
    case closeIcon
    case clear
    case cloud
    case drizzle
    case rain
    case snow
    case thunderstorm
    case delete
    
    typealias Value = UIImage
    
    var value: UIImage {
        switch self {
        case .searchIcon:
            return UIImage(imageLiteralResourceName: "searchIcon")
        case .closeIcon:
            return UIImage(imageLiteralResourceName: "closeIcon")
        case .clear:
            return UIImage(imageLiteralResourceName: "clear")
        case .cloud:
            return UIImage(imageLiteralResourceName: "cloud")
        case .drizzle:
            return UIImage(imageLiteralResourceName: "drizzle")
        case .rain:
            return UIImage(imageLiteralResourceName: "rain")
        case .snow:
            return UIImage(imageLiteralResourceName: "snow")
        case .thunderstorm:
            return UIImage(imageLiteralResourceName: "thunderstorm")
        case .delete:
            return UIImage(imageLiteralResourceName: "delete")
        }
    }
    
}

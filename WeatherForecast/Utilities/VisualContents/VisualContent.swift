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
    
    typealias Value = UIImage
    
    var value: UIImage {
        switch self {
        case .searchIcon:
            return UIImage(imageLiteralResourceName: "searchIcon")
        case .closeIcon:
            return UIImage(imageLiteralResourceName: "closeIcon")
        }
    }
    
}

//
//  ApplicationStoryBoards.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

enum ApplicationStoryBoards: GenericDescriptorProtocol {
    
    typealias Value = String
    
    case main
    case splashScreen
    
    var value: String {
        switch self {
        case .main:
            return "Main"
        case .splashScreen:
            return "SplashScreen"
        }
    }
    
}

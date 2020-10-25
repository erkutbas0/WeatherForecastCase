//
//  StoryBoardIdentifiers.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

public enum StoryBoardIdentifiers: GenericDescriptorProtocol {
    case tutorial
    
    typealias Value = String
    
    var value: String {
        switch self {
        case .tutorial:
            return "Tutorial"
            
        }
    }

}

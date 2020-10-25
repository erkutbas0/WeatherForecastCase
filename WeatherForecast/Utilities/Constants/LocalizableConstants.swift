//
//  LocalizableConstants.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

public typealias LabelPrompts = LocalizableString.LabelPrompts

public enum LocalizableString {
    
    public enum LabelPrompts: GenericDescriptorProtocol {
        case components
        case currencyTail
        case stars
        case evaluation
        case reportItem
        case addProductCart

        typealias Value = String
        
        var value: String {
            switch self {
            case .components:
                return "Components".toLocalize()
            case .currencyTail:
                return "currencyTail".toLocalize()
            case .stars:
                return "stars".toLocalize()
            case .evaluation:
                return "evaluation".toLocalize()
            case .reportItem:
                return "reportItem".toLocalize()
            case .addProductCart:
                return "addProductCart".toLocalize()
                
            }
        }
    }
    
}

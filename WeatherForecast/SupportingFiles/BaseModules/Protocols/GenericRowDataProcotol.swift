//
//  GenericRowDataProcotol.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//
import Foundation

protocol GenericRowDataProtocol: GenericDataProtocol {
    
    var sectionType: SectionType { get }
    var contentCount: Int { get }
    
}

enum SectionType {
    case main
    case reportAction
    case spare
}

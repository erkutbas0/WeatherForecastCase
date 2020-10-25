//
//  GenericDescriptorProtocol.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

protocol GenericDescriptorProtocol {
    
    associatedtype Value
    var value: Value { get }
}

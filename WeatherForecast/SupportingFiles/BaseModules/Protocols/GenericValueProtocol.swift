//
//  GenericValueProtocol.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value { get }
}

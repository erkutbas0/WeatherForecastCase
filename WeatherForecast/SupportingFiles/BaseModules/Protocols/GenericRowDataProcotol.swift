//
//  GenericRowDataProcotol.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//
import Foundation

protocol GenericRowDataProtocol: GenericDataProtocol {
    
    var itemId: Int64 { get }
    
}

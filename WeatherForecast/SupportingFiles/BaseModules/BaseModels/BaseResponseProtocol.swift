//
//  BaseResponseProtocol.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

protocol BaseResponseProtocol: CodableDataProtocol {
    var returnCode: Int? { get }
    var returnMessage: String? { get }
}

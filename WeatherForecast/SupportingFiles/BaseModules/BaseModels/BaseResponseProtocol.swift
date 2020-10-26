//
//  BaseResponseProtocol.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

protocol BaseResponseProtocol: CodableDataProtocol {
    var cod: String? { get }
    var message: Double? { get }
}

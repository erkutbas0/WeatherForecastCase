//
//  ViewControllerTypeProtocol.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

protocol ViewControllerTypeProtocol {
    var viewTitle: String? { get }
}

extension ViewControllerTypeProtocol {
    func returnValue() -> String? {
        return viewTitle
    }
}

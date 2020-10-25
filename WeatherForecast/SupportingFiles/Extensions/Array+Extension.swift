//
//  Array+Extension.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import Foundation

extension Array {
    func getElement(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}

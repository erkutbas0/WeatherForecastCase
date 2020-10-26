//
//  LocalizableConstants.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

public typealias MainViewLocalizables = LocalizableString.MainViewLocalizables
public typealias CitySearchViewLocalizables = LocalizableString.CitySearchViewLocalizables

public enum LocalizableString {
    
    public enum MainViewLocalizables: GenericValueProtocol {
        case headerTitle

        typealias Value = String
        
        var value: String {
            switch self {
            case .headerTitle:
                return "mainView_HeaderTitle".toLocalize()
            }
        }
    }
    
    public enum CitySearchViewLocalizables: GenericValueProtocol {
        case headerTitle
        case cityPlaceHolder
        case dailyCountPlaceHolder
        case buttonContinue

        typealias Value = String
        
        var value: String {
            switch self {
            case .headerTitle:
                return "citySearchView_HeaderTitle".toLocalize()
            case .cityPlaceHolder:
                return "citySearchView_CityPlaceHolder".toLocalize()
            case .dailyCountPlaceHolder:
                return "citySearchView_DailyCount".toLocalize()
            case .buttonContinue:
                return "citySearchView_ContinueButtonTitle".toLocalize()
            }
        }
    }
    
}

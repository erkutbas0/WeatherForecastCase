//
//  LocalizableConstants.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

public typealias MainViewLocalizables = LocalizableString.MainViewLocalizables
public typealias CitySearchViewLocalizables = LocalizableString.CitySearchViewLocalizables
public typealias DetailViewLocalizables = LocalizableString.DetailViewLocalizables
public typealias WarningLocalizables = LocalizableString.WarningLocalizables

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
    
    public enum DetailViewLocalizables: GenericValueProtocol {
        
        case highestDegreePrefix
        case lowestDegreePrefix

        typealias Value = String
        
        var value: String {
            switch self {
            case .highestDegreePrefix:
                return "detailView_highestDegreePrefix".toLocalize()
            case .lowestDegreePrefix:
                return "detailView_lowestDegreePrefix".toLocalize()
            }
        }
        
    }
    
    public enum WarningLocalizables: GenericValueProtocol {
        
        case warningTitle

        typealias Value = String
        
        var value: String {
            switch self {
            case .warningTitle:
                return "warningTitle".toLocalize()
            }
        }
        
    }
    
}

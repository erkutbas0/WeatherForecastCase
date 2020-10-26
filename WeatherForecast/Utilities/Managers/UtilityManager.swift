//
//  UtilityManager.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

class UtilityManager {

    static let appId: String = "41a47c0c4d7d86694bd472f51e33f937"
    
    /// Description: Returns BaseUrl for endpoint calls
    /// - Parameter environment: Environments such as test, development, etc...
    class func returnBaseUrl(environment: Environments = .development) -> String {
        return BaseEndPoints(environment: environment).returnBaseUrl()
    }
    
}

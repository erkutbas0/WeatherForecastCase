//
//  GroupSearchRequest.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class WeatherGroupForeCastRequest: CodableDataProtocol {
    
    private(set) var cityId: Array<String>
    private(set) var appId: String = UtilityManager.appId
    
    init(cityId: Array<String>) {
        self.cityId = cityId
    }
    
    enum CodingKeys: String, CodingKey {
        case cityId = "id"
        case appId = "appid"
    }
    
}

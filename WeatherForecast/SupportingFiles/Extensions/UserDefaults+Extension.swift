//
//  UserDefaults+Extension.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//


import Foundation

// MARK: - UserDefaults Extensions -
extension UserDefaults {
    static let group = UserDefaults(suiteName: "group.com.LocalNotificationGroup")
    
    open func setStruct<T: Codable>(_ value: T?, forKey defaultName: String){
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }
    
    open func structData<T>(_ type: T.Type, forKey defaultName: String) -> T? where T : Decodable {
        guard let encodedData = data(forKey: defaultName) else {
            return nil
        }
        
        return try? JSONDecoder().decode(type, from: encodedData)
    }
    
}

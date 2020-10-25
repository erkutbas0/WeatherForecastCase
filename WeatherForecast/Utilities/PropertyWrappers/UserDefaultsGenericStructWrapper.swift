//
//  UserDefaultsGenericStructWrapper.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//
import Foundation

@propertyWrapper
struct UserDefaultsGenericStructWrapper<T1: CodableDataProtocol, T2: CodableDataProtocol> {
    let key: String
    let defaultValue: T1
    let type: T2.Type

    init(_ type: T2.Type, _ key: String, defaultValue: T1) {
        self.key = key
        self.defaultValue = defaultValue
        self.type = type
    }

    var wrappedValue: T1 {
        get {
            return UserDefaults.standard.structData(T2.self, forKey: key) as? T1 ?? defaultValue
        }
        set {
            UserDefaults.standard.setStruct(newValue, forKey: key)
        }
    }
}

struct UserDefaultsGenericStructStore {
}


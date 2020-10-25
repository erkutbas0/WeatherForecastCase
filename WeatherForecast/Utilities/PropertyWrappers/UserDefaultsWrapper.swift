//
//  UserDefaultsWrapper.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

@propertyWrapper
struct UserDefaultWrapper<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsStore {
    @UserDefaultWrapper("has_launch_before", defaultValue: false)
    static var hasLaunchBefore: Bool
}


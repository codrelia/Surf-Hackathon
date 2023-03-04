//
//  LocalStorage.swift
//  Template
//

import Foundation

/// Утилита для сохранения локальных настроек пользователя и подобных данных
/// Работат через `UserDefaults`
public enum LocalStorage {
    
    private enum Keys: String {
        case isOnboardingFinished
        case isCameraPermission
    }
    
    private static var storage: UserDefaults {
        .standard
    }

}

public extension LocalStorage {

    static var isOnboardingFinished: Bool {
        get {
            storage.bool(forKey: Keys.isOnboardingFinished.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.isOnboardingFinished.rawValue)
        }
    }
    
    static var isCameraPermission: Bool {
        get {
            storage.bool(forKey: Keys.isCameraPermission.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.isCameraPermission.rawValue)
        }
    }

}

//
//  UserDefaultsManager.swift
//  Konieg
//
//  Created by David I on 19.12.2024.
//

import Foundation

class UserDefaultsManager {
    private let defaults = UserDefaults.standard

    func saveString(key: String, value: String) {
        defaults.set(value, forKey: key)
    }

    func getString(key: String) -> String? {
        return defaults.string(forKey: key)
    }

    func saveInteger(key: String, value: Int) {
        defaults.set(value, forKey: key)
    }

    func getInteger(key: String) -> Int? {
        return defaults.integer(forKey: key)
    }

    func saveBool(key: String, value: Bool) {
        defaults.set(value, forKey: key)
    }

    func getBool(key: String) -> Bool? {
        return defaults.bool(forKey: key)
    }

    func saveArray(key: String, value: [Any]) {
        defaults.set(value, forKey: key)
    }

    func getArray(key: String) -> [Any]? {
        return defaults.array(forKey: key)
    }

    func saveDictionary(key: String, value: [String: Any]) {
        defaults.set(value, forKey: key)
    }

    func getDictionary(key: String) -> [String: Any]? {
        return defaults.dictionary(forKey: key)
    }

    func removeValue(key: String) {
        defaults.removeObject(forKey: key)
    }

    func synchronize() {
        defaults.synchronize()
    }
}

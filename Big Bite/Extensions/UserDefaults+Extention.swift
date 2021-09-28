//
//  UserDefaults+Extention.swift
//  Big Bite
//
//  Created by Andrey Alymov on 28.09.2021.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOndoarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOndoarded.rawValue)
        }
        
        set{
            setValue(newValue, forKey: UserDefaultsKeys.hasOndoarded.rawValue)
        }
    }
}

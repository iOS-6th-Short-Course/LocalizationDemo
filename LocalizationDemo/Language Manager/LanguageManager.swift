//
//  LanguageManager.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 1/26/19.
//  Copyright © 2019 Chhaileng Peng. All rights reserved.
//

import Foundation

class LanguageManager {
    
    // shared instance, shared object, singleton pattern
    static let shared = LanguageManager()
    
    var languauge: String {
        get {
            if let lang = UserDefaults.standard.string(forKey: "LanguageCode") {
                return lang
            } else {
                return self.languauge
            }
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "LanguageCode")
        }
    }
    
}


extension String {
    
    var localized: String {
        let path = Bundle.main.path(forResource: LanguageManager.shared.languauge, ofType: "lproj")
        let bundle = Bundle(path: path!)
        let translated = bundle?.localizedString(forKey: self, value: nil, table: nil)
        return translated!
    }
    
}

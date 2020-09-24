//
//  Theme.swift
//  youtube
//
//  Created by Marwan Osama on 9/24/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    
    let textColor: UIColor
    let backgroundColor: UIColor
    let barStatus: UIBarStyle
    
    static let lightMode = Theme(textColor: .black, backgroundColor: .white, barStatus: .default)
    static let darkMode = Theme(textColor: .white, backgroundColor: .black, barStatus: .black)
}


struct ThemeManager {
    
    static let isDarkModeKey = "isDarkMode"
    static let darkModeHasChanged = Notification.Name(rawValue: "darkModeHasChanged")
    
    static var currentTheme: Theme {
        return isDarkMode() ? Theme.darkMode : Theme.lightMode
    }
    
    static func isDarkMode() -> Bool {
        return UserDefaults.standard.bool(forKey: isDarkModeKey)
    }
    
    
    static func addObserver(observer: Any, selector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: darkModeHasChanged, object: nil)
    }
    
    
    
    
    static func enableDarkMode() {
        UserDefaults.standard.set(true, forKey: isDarkModeKey)
        NotificationCenter.default.post(name: darkModeHasChanged, object: nil)
        

    }
    
    static func disableDarkMode() {
        UserDefaults.standard.set(false, forKey: isDarkModeKey)
        NotificationCenter.default.post(name: darkModeHasChanged, object: nil)
    }
    
    
    static func setupTheme() {
        
        
        
    }
    
    
    
    
    
}

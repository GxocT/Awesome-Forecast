//
//  AppearanceManager.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

final class AppearanceManager {
    
    static var shared = AppearanceManager()
    
    private struct Colors {
        static let day: UIColor = #colorLiteral(red: 0.9739639163, green: 0.7061158419, blue: 0.1748842001, alpha: 1)
        static let night: UIColor = #colorLiteral(red: 0.3527560234, green: 0.6400019526, blue: 0.9096098542, alpha: 1)
    }
    
    private init() {}
    
    var backgroundColor: UIColor {
        return primaryColor
    }
    
    func apply() {
        UIApplication.shared.statusBarStyle = .lightContent
        
        UITabBar.appearance().tintColor = invertPrimaryColor
    }
    
    var primaryColor: UIColor {
        return Date().isDay() ? Colors.day : Colors.night
    }
    
    var invertPrimaryColor: UIColor {
        return Date().isDay() ? Colors.night : Colors.day
    }
}

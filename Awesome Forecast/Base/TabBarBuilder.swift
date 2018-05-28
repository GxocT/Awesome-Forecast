//
//  TabBarBuilder.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

enum TabBarBuilder {
    case authorised
    case guest
    
    func build(networkManager: NetworkManager, authService: AuthService) -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let todayViewController = TodayBuilder.buildModule(networkManager: networkManager)
        todayViewController.title = "Today"
        
        let weeklyViewController = WeeklyBuilder.buildModule(networkManager: networkManager)
        weeklyViewController.title = "Weekly"
        
        switch self {
        case .authorised:
            let profileViewController = ProfileBuilder.buildModule(authService: authService)
            profileViewController.title = "Profile"
            
            tabBarController.setViewControllers([todayViewController, weeklyViewController, profileViewController], animated: true)
            return tabBarController
        case .guest:
            tabBarController.setViewControllers([todayViewController, weeklyViewController], animated: true)
            return tabBarController
        }
    }
}

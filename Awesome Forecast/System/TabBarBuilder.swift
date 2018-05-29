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
    
    func build(networkManager: NetworkManager, authService: AuthService, profileService: ProfileService) -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let todayViewController = TodayBuilder.buildModule(networkManager: networkManager)
        todayViewController.title = NSLocalizedString("Tab.Today", comment: "")
        todayViewController.tabBarItem.image = #imageLiteral(resourceName: "today_tab")
        
        let weeklyViewController = WeeklyBuilder.buildModule(networkManager: networkManager)
        weeklyViewController.title = NSLocalizedString("Tab.Weekly", comment: "")
        weeklyViewController.tabBarItem.image = #imageLiteral(resourceName: "week_tab")
        
        switch self {
        case .authorised:
            let profileViewController = ProfileBuilder.buildModule(authService: authService, pofileService: profileService)
            profileViewController.title = NSLocalizedString("Tab.Profile", comment: "")
            profileViewController.tabBarItem.image = #imageLiteral(resourceName: "profile_tab")
            
            tabBarController.setViewControllers([todayViewController, weeklyViewController, profileViewController], animated: true)
            return tabBarController
        case .guest:
            tabBarController.setViewControllers([todayViewController, weeklyViewController], animated: true)
            return tabBarController
        }
    }
}

//
//  TabBarBuilder.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class TabBarBuilder {
    
    static func build(networkManager: NetworkManager) -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let todayViewController = TodayBuilder.buildModule(networkManager: networkManager)
        todayViewController.title = "Today"
        
        let weeklyViewController = WeeklyBuilder.buildModule(networkManager: networkManager)
        weeklyViewController.title = "Weekly"
        
        let profileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(type: ProfileViewController.self)
        profileViewController.title = "Profile"
        
        tabBarController.setViewControllers([todayViewController, weeklyViewController, profileViewController], animated: true)
        
        return tabBarController
    }
    
}

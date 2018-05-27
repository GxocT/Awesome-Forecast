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
        
        let weeklyViewController = WeeklyBuilder.buildModule()
        weeklyViewController.title = "Weekly"
        
        tabBarController.setViewControllers([todayViewController, weeklyViewController], animated: true)
        
        return tabBarController
    }
    
}

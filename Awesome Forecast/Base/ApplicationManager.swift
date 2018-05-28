//
//  ApplicationManager.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

import FBSDKLoginKit

class AuthManager {
    
    var isAuthorized: Bool {
        return FBSDKAccessToken.current() != nil
    }
}

class ApplicationManager {
    
    private var networkManager = NetworkManager()
    private var authManager = AuthManager()
    
    private var rootViewController: UIViewController? {
        didSet {
            appDelegate.window?.rootViewController = rootViewController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
    
    private var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    class var shared: ApplicationManager {
        return (UIApplication.shared.delegate as! AppDelegate).applicationManager
    }
    
    func getStart() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        
        if authManager.isAuthorized {
            showAuthorizedScreens()
        } else {
            showLoginScreen()
        }
    }
    
    func showAuthorizedScreens() {
        rootViewController = TabBarBuilder.authorised.build(with: networkManager)
    }
    
    func showGuestScreens() {
        rootViewController = TabBarBuilder.guest.build(with: networkManager)
    }
    
    func showLoginScreen() {
        rootViewController = LoginBuilder.buildModule()
    }
    
}
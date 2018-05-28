//
//  ProfileRouter.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class ProfileRouter: ProfilePresenterToRouterProtocol {
    
    func openLoginScreen() {
        ApplicationManager.shared.showLoginScreen()
    }
    
}

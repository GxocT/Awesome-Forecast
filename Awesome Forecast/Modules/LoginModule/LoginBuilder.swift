//
//  LoginBuilder.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class LoginBuilder {
    
    static func buildModule() -> LoginViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(type: LoginViewController.self)
        
        let presenter = LoginPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        
        let interactor = LoginInteractor()
        presenter.interector = interactor
        interactor.presenter = presenter
        
        let router = LoginRouter()
        presenter.router = router
        
        return viewController
    }
    
}

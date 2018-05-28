//
//  ProfileBuilder.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ProfileBuilder {
    
    static func buildModule() -> ProfileViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(type: ProfileViewController.self)
        
        let presenter = ProfilePresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        
        let interactor = ProfileInteractor()
        presenter.interector = interactor
        interactor.presenter = presenter
        
        let router = ProfileRouter()
        presenter.router = router
        
        return viewController
    }
    
}

//
//  WeeklyBuilder.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

final class WeeklyBuilder {
    
    static func buildModule(networkManager: Networkable) -> WeeklyViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(type: WeeklyViewController.self)
        
        let presenter = WeeklyPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        
        let interactor = WeeklyInteractor(networkManager: networkManager)
        presenter.interector = interactor
        interactor.presenter = presenter
        
        let router = WeeklyRouter()
        presenter.router = router
        
        return viewController
    }
    
}

//
//  TodayBuilder.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

final class TodayBuilder {
    
    static func buildModule(networkManager: Networkable) -> TodayViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(type: TodayViewController.self)
        
        let presenter = TodayPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        
        let interactor = TodayInteractor(networkManager: networkManager)
        presenter.interector = interactor
        interactor.presenter = presenter
        
        let router = TodayRouter()
        presenter.router = router
        
        return viewController
    }
    
}

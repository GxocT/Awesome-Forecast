//
//  TodayPresenter.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation


class TodayPresenter: TodayViewToPresenterProtocol, TodayInterectorToPresenterProtocol {
    
    weak var view: TodayPresenterToViewProtocol!
    var interector: TodayPresenterToInterectorProtocol!
    var router: TodayPresenterToRouterProtocol!
    
}

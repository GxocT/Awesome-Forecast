//
//  WeeklyProtocols.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

protocol WeeklyViewToPresenterProtocol: class {
    func updateView()
}

protocol WeeklyPresenterToViewProtocol: class {
    func showWeather(_ items: [WeeklyCellItem])
    func showError(_ description: String)
}

protocol WeeklyPresenterToInterectorProtocol: class {
    func loadWeaterData()
}

protocol WeeklyInterectorToPresenterProtocol: class {
    func weatherLoaded(_ weekly: WeeklyWeather)
    func weatherLoadFailed(description: String)
}

protocol WeeklyPresenterToRouterProtocol: class {
}

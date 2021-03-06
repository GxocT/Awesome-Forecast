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
    func showWeather(items: [WeeklyCellModel], locationInfo: String)
    func showError(_ description: String)
}

protocol WeeklyPresenterToInterectorProtocol: class {
    func loadWeaterData()
}

protocol WeeklyInterectorToPresenterProtocol: class {
    func weatherLoaded(_ weekly: WeeklyWeather)
    func weatherLoadFailed(error: AppError)
}

protocol WeeklyPresenterToRouterProtocol: class {
}

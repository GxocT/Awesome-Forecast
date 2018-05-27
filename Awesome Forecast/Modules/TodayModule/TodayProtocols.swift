//
//  TodayProtocols.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

protocol TodayViewToPresenterProtocol: class {
    func updateView()
}

protocol TodayPresenterToViewProtocol: class {
    func showWeather(viewModel: TodayViewModel)
    func showError(_ description: String)
}

protocol TodayPresenterToInterectorProtocol: class {
    func loadWeaterData()
}

protocol TodayInterectorToPresenterProtocol: class {
    func weatherLoaded(weather: CurrentWeather, locationInfo: String)
    func weatherLoadFailed(description: String)
}

protocol TodayPresenterToRouterProtocol: class {
}

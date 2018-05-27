//
//  TodayPresenter.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class TodayPresenter {
    
    weak var view: TodayPresenterToViewProtocol!
    var interector: TodayPresenterToInterectorProtocol!
    var router: TodayPresenterToRouterProtocol!
    
}

extension TodayPresenter: TodayViewToPresenterProtocol {
    
    func updateView() {
        interector.loadWeaterData()
    }
    
}

extension TodayPresenter: TodayInterectorToPresenterProtocol {
    
    func weatherLoaded(_ weather: CurrentWeather) {
        view.showWeather(locationInfo: weather.name,
                         temperature: Int(weather.main.temp).temperatureStringPresentation(),
                         details: weather.weather.first!.description,
                         wind: weather.wind.stringRepresentation())
    }
    
    func weatherLoadFailed(description: String) {
        view.showError(description)
    }
    
}

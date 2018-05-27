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
    
    func weatherLoaded(weather: CurrentWeather, locationInfo: String) {
        let viewModel = TodayViewModel(locationInfo: locationInfo,
                                       weatherIcon: WeatherType(id: weather.weather?.id).getImage(),
                                       temperature: Int(weather.main.temp).temperatureStringPresentation(),
                                       details: weather.weather?.description,
                                       windInfo: weather.wind?.stringRepresentation())
        view.showWeather(viewModel: viewModel)
    }
    
    func weatherLoadFailed(description: String) {
        view.showError(description)
    }
    
}

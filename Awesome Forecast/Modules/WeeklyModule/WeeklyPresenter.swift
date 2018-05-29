//
//  WeeklyPresenter.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class WeeklyPresenter {
    
    weak var view: WeeklyPresenterToViewProtocol!
    var interector: WeeklyPresenterToInterectorProtocol!
    var router: WeeklyPresenterToRouterProtocol!
    
}

extension WeeklyPresenter: WeeklyViewToPresenterProtocol {
    
    func updateView() {
        interector.loadWeaterData()
    }
    
}

extension WeeklyPresenter: WeeklyInterectorToPresenterProtocol {
    
    func weatherLoaded(_ weekly: WeeklyWeather) {
        
        let items = weekly.list
            .filter { (notfilteredItem) -> Bool in
                return notfilteredItem.date.isMidday()
            }
            .map { (rawItem) -> WeeklyCellModel in
                return WeeklyCellModel(date: rawItem.date.toDayMonthString(),
                                      dayOfWeek: rawItem.date.dayOfTheWeek()!,
                                      temperature: Int(rawItem.main.temp).temperatureStringPresentation(),
                                      weatherType: WeatherType(id: rawItem.weather.first!.id))
        }
        
        self.view.showWeather(items: items, locationInfo: weekly.city.name)
    }
    
    func weatherLoadFailed(error: AppError) {
        view.showError(error.message)
    }
}

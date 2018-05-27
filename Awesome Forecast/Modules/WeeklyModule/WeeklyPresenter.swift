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
            .map { (rawItem) -> WeeklyCellItem in
                return WeeklyCellItem(date: rawItem.date.toDayMonthString(),
                                      dayOfWeek: rawItem.date.dayOfTheWeek()!,
                                      temperature: Int(rawItem.main.temp).temperatureStringPresentation())
        }
        
        self.view.showWeather(items)
    }
    
    func weatherLoadFailed(description: String) {
        
    }
}

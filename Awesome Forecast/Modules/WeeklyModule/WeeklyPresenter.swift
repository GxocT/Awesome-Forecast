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
        let items = weekly.list.map { (rawItem) -> WeeklyCellItem in
            return WeeklyCellItem(date: "23 May",
                                  dayOfWeek: "Wednesday",
                                  temperature: Int(rawItem.main.temp).temperatureStringPresentation())
        }
        DispatchQueue.main.async {
            self.view.showWeather(items)
        }
    }
    
    func weatherLoadFailed(description: String) {
        
    }
}

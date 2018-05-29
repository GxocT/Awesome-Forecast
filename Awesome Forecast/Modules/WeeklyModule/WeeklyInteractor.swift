//
//  WeeklyInteractor.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class WeeklyInteractor {
    
    weak var presenter: WeeklyInterectorToPresenterProtocol!
    
    private let networkManager: Networkable
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
}

extension WeeklyInteractor: WeeklyPresenterToInterectorProtocol {
    
    func loadWeaterData() {
        LocationManager.shared.getCurrentCity { [weak self] (result) in
            switch result {
            case .success(let city):
                self?.networkManager.getWeeklyWeather(city: city) { (result) in
                    switch result {
                    case .success(let weather):
                        self?.presenter.weatherLoaded(weather)
                    case .error(let error):
                        self?.presenter.weatherLoadFailed(error: error)
                    }
                }
            case .error(let error):
                self?.presenter.weatherLoadFailed(error: error)
            }
        }
    }
    
}

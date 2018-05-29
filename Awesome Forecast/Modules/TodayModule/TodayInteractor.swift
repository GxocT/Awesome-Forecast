//
//  TodayInteractor.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class TodayInteractor {
    
    weak var presenter: TodayInterectorToPresenterProtocol!
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
}

extension TodayInteractor: TodayPresenterToInterectorProtocol {
    
    func loadWeaterData() {
        LocationManager.shared.getCurrentCity { [weak self] (result) in
            switch result {
            case .success(let city):
                self?.networkManager.getCurrentWeather(city: city) { (result) in
                    switch result {
                    case .success(let weather):
                        self?.presenter.didLoadWeather(weather, locationInfo: city)
                    case .error(let error):
                        self?.presenter.didFailWithError(error)
                    }
                }
            case .error(let error):
                self?.presenter.didFailWithError(error)
            }
        }
    }
    
}

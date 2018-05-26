//
//  ForecastApi.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 26/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import Moya

enum ForecastApi {
    case current(city: String)
    case weekly(city: String)
    
    enum RequestKey: String {
        case city = "q"
        case units
        case apiKey = "APPID"
    }
}

extension ForecastApi: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/") else {
            fatalError("baseURL could not be configured.")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .current:
            return "weather"
        case .weekly:
            return "forecast"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .current(let city), .weekly(let city):
            return .requestParameters(parameters: [RequestKey.city.rawValue: city,
                                                   RequestKey.units.rawValue: "metric",
                                                   RequestKey.apiKey.rawValue: NetworkManager.apiKey],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

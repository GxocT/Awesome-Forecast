//
//  NetworkManager.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 26/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<ForecastApi> { get }
    
    func getCurrentWeather(city: String, completion: @escaping (ResponseResult<CurrentWeather>) -> ())
    func getWeeklyWeather(city: String, completion: @escaping (ResponseResult<WeeklyWeather>) -> ())
}

struct NetworkManager: Networkable {
    
    static let apiKey = "d22191f992a49caade08ff3888b4c003"
    
    let provider = MoyaProvider<ForecastApi>(plugins: [NetworkLoggerPlugin.init(verbose: true)])
    
    func getCurrentWeather(city: String, completion: @escaping (ResponseResult<CurrentWeather>) -> ()) {
        provider.request(.current(city: city)) { (result) in
            completion(result.convert(to: CurrentWeather.self))
        }
    }
    
    func getWeeklyWeather(city: String, completion: @escaping (ResponseResult<WeeklyWeather>) -> ()) {
        provider.request(.weekly(city: city)) { (result) in
            completion(result.convert(to: WeeklyWeather.self))
        }
    }
    
}



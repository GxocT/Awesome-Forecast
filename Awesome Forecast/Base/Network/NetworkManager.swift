//
//  NetworkManager.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 26/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol Networkable {
    var provider: MoyaProvider<ForecastApi> { get }
    
    static var isConnectionAvailable: Bool { get }
    
    func getCurrentWeather(city: String, completion: @escaping (ResponseResult<CurrentWeather>) -> ())
    func getWeeklyWeather(city: String, completion: @escaping (ResponseResult<WeeklyWeather>) -> ())
}

struct NetworkManager: Networkable {
    
    static let apiKey = "d22191f992a49caade08ff3888b4c003"
    
    static var isConnectionAvailable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    let provider = MoyaProvider<ForecastApi>() // Logging: MoyaProvider<ForecastApi>(plugins: [NetworkLoggerPlugin.init(verbose: true)])
    
    func getCurrentWeather(city: String, completion: @escaping (ResponseResult<CurrentWeather>) -> ()) {
        request(target: .current(city: city), completion: completion)
    }
    
    func getWeeklyWeather(city: String, completion: @escaping (ResponseResult<WeeklyWeather>) -> ()) {
        request(target: .weekly(city: city), completion: completion)
    }
    
    private func request<T: Decodable>(target: ForecastApi, completion: @escaping (ResponseResult<T>) -> ()) {
        guard NetworkManager.isConnectionAvailable else {
            let title = NSLocalizedString("Log_title.Network", comment: "")
            let description = NSLocalizedString("Error.No_internet_connection", comment: "")
            ConsoleLogger.log(event: .fail, title: title, message: description)
            completion(.error(.network(description)))
            return
        }
        
        provider.request(target) { (result) in
            completion(result.convert(to: T.self))
        }
    }
    
    
}



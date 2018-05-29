//
//  ResponseResult.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 26/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import Result
import Moya

enum ResponseResult<T> {
    case success(T)
    case error(AppError)
}

extension Result where T: Moya.Response {
    
    func convert<R: Decodable>(to resultType: R.Type) -> ResponseResult<R> {
        let title = "Request"
        switch self {
        case .success(let response):
            do {
                let mapped = try response.map(R.self)
                ConsoleLogger.log(event: .success, title: title)
                return ResponseResult.success(mapped)
            } catch {
                ConsoleLogger.log(event: .fail, title: title)
                return ResponseResult.error(.network(error.localizedDescription))
            }
        case .failure(let error):
            if let moyaError = error as? MoyaError, let errorString = moyaError.errorDescription {
                ConsoleLogger.log(event: .fail, title: title, message: errorString)
                return ResponseResult.error(.network(errorString))
            } else {
                ConsoleLogger.log(event: .fail, title: title, message: error.localizedDescription)
                return ResponseResult.error(.network(error.localizedDescription))
            }
        }
    }
}

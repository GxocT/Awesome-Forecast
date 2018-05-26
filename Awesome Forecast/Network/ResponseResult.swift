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
    case error(String)
}

extension Result where T: Moya.Response {
    
    func convert<R: Decodable>(to resultType: R.Type) -> ResponseResult<R> {
        switch self {
        case .success(let response):
            do {
                let mapped = try response.map(R.self)
                return ResponseResult.success(mapped)
            } catch {
                return ResponseResult.error(error.localizedDescription)
            }
        case .failure(let error):
            if let moyaError = error as? MoyaError, let errorString = moyaError.errorDescription {
                return ResponseResult.error(errorString)
            } else {
                return ResponseResult.error(error.localizedDescription)
            }
        }
    }
}

//
//  AppError.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 29/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

enum AppError {
    case auth(String)
    case network(String)
    case location(String)
    case unknow
    
    var message: String {
        switch self {
        case .auth(let m): return m
        case .network(let m): return m
        case .location(let m): return m
        case .unknow: return NSLocalizedString("Error.Unknown", comment: "")
        }
    }
}

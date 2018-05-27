//
//  WeatherType.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

enum WeatherType {
    case thunderstorm
    case atmosphere
    case rain
    case snow
    case clear
    case clouds
    case unknown
    
    init(id: Int?) {
        switch id {
        case .some(200..<300):                      self = .thunderstorm
        case .some(300..<400), .some(500..<600):    self = .rain
        case .some(600..<700):                      self = .snow
        case .some(700..<800):                      self = .atmosphere
        case .some(801...809):                      self = .clouds
        case .some(800):                            self = .clear
        default:                                    self = .unknown
        }
    }
    
    func getImage(isDependOnTime: Bool = true) -> UIImage? {
        switch self {
        case .thunderstorm: return UIImage(named: "thunderbolt")
        case .atmosphere: return UIImage(named: "mist")
        case .rain: return UIImage(named: "rain")
        case .snow: return UIImage(named: "snow")
        case .clouds: return UIImage(named: "cloud")
        case .clear:
            if isDependOnTime {
                return Date().isDay() ? UIImage(named: "sun") : UIImage(named: "moon")
            } else {
                return UIImage(named: "sun")
            }
        case .unknown: return UIImage(named: "unknown")
        }
    }
}

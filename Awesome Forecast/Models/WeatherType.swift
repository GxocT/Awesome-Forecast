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
    
    init(id: Int) {
        switch id {
        case 200..<300:             self = .thunderstorm
        case 300..<400, 500..<600:  self = .rain
        case 600..<700:             self = .snow
        case 700..<800:             self = .atmosphere
        case 801...809:             self = .clouds
        default:                    self = .clear
            
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
        }
    }
}

//
//  CurrentWeather.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 25/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let weather: Weather?
    let main: MainInfo
    let wind: Wind?
}

extension CurrentWeather: Decodable {
    
    enum CurrentWeatherCodingKey: String, CodingKey {
        case weather
        case main
        case wind
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CurrentWeatherCodingKey.self)
        
        main = try container.decode(MainInfo.self, forKey: .main)
        wind = try container.decodeIfPresent(Wind.self, forKey: .wind)
        
        let weatherList = try container.decode(Array<Weather>.self, forKey: .weather)
        weather = weatherList.first
    }
}

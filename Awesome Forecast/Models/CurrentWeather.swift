//
//  CurrentWeather.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 25/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

struct CurrentWeather: Decodable {
    let name: String
    let weather: [Weather]
    let main: MainInfo
    let wind: Wind
}

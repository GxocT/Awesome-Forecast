//
//  WeeklyWeather.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 25/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

struct WeeklyWeather: Decodable {
    let city: City
    let list: [WeeklyItem]
}

struct City: Decodable {
    let id: Int
    let name: String
    let country: String
}



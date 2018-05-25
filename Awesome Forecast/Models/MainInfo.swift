//
//  MainInfo.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 25/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

struct MainInfo: Decodable {
    let temp: Float
    let pressure: Float
    let humidity: Float
    let temp_min: Float
    let temp_max: Float
}

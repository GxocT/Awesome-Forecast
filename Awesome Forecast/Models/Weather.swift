//
//  Weather.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 25/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

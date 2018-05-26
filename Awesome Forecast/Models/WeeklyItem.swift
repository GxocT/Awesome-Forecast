//
//  WeeklyItem.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 26/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

struct WeeklyItem {
    let date: Date
    let main: MainInfo
    let weather: [Weather]
    let wind: Wind
}

extension WeeklyItem: Decodable {
    
    enum WeeklyItemCodingKeys: String, CodingKey {
        case date = "dt"
        case main
        case weather
        case wind
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WeeklyItemCodingKeys.self)
        
        let timestamp = try container.decode(Int.self, forKey: .date)
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        main = try container.decode(MainInfo.self, forKey: .main)
        weather = try container.decode(Array<Weather>.self, forKey: .weather)
        wind = try container.decode(Wind.self, forKey: .wind)
    }
    
}

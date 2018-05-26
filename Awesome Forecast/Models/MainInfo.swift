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
    let tempMin: Float
    let tempMax: Float
}

extension MainInfo {
    
    enum MainInfoCodingKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MainInfoCodingKeys.self)
        
        temp = try container.decode(Float.self, forKey: .temp)
        pressure = try container.decode(Float.self, forKey: .pressure)
        humidity = try container.decode(Float.self, forKey: .humidity)
        tempMin = try container.decode(Float.self, forKey: .tempMin)
        tempMax = try container.decode(Float.self, forKey: .tempMax)
    }
    
}

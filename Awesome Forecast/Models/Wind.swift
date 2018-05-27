//
//  Wind.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 25/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

enum Direction: String {
    case N, NNE, NE, ENE, E, ESE, SE, SSE, S, SSW, SW, WSW, W, WNW, NW, NNW
    
    init(degrees: Float) {
        var deg = degrees
        if deg > 360 {
            deg = deg.truncatingRemainder(dividingBy: 360)
        }
        
        switch deg {
        case 11.25..<33.75:   self = .NNE
        case 33.75..<56.25:   self = .NE
        case 56.25..<78.75:   self = .ENE
        case 78.75..<101.25:  self = .NNE
        case 101.25..<123.75: self = .ESE
        case 123.75..<146.25: self = .SE
        case 146.25..<168.75: self = .SSE
        case 168.75..<191.25: self = .S
        case 191.25..<213.75: self = .SSW
        case 213.75..<236.25: self = .SW
        case 236.25..<258.75: self = .WSW
        case 258.75..<281.25: self = .W
        case 281.25..<303.75: self = .WNW
        case 303.75..<326.25: self = .NW
        case 326.25..<348.75: self = .NNW
        default:              self = .N
        }
    }
}

struct Wind {
    let speed: Float
    let direction: Direction
    
    func stringRepresentation() -> String {
        return String(format: "%@ %.1f m/s", direction.rawValue, speed)
    }
}

extension Wind: Decodable {
    
    enum WindCodingKeys: String, CodingKey {
        case speed
        case deg
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WindCodingKeys.self)
        
        speed = try container.decode(Float.self, forKey: .speed)
        let degrees = try container.decode(Float.self, forKey: .deg)
        direction = Direction(degrees: degrees)
    }
}

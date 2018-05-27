//
//  TemperaturePresentable.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

protocol TemperaturePresentable {
    func temperatureStringPresentation() -> String
}

extension Int: TemperaturePresentable {
    func temperatureStringPresentation() -> String {
        let sign = self > 0 ? "+" : "-"
        return String(format: "%@%d°", sign, self)
    }
}

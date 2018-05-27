//
//  Date+Extension.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

extension Date {
    
    func dayOfTheWeek() -> String? {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    func isMidday() -> Bool {
        guard let hour = Calendar.current.dateComponents([.hour], from: self).hour else { return false }
        return hour == 12
    }
    
    func toDayMonthString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter.string(from: self)
    }
    
    func isDay() -> Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        
        return (6..<23).contains(hour)
    }
}

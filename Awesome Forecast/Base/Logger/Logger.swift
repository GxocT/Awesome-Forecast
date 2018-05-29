//
//  Logger.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 29/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

enum LogEvent: String {
    case open
    case pressButton = "Press button"
    case success = "Success"
    case fail = "Fail"
}

protocol Logger {
    static func log(event: LogEvent, title: String?, message: String?)
}

class ConsoleLogger: Logger {
    
    static func log(event: LogEvent, title: String?, message: String? = nil) {
        var toPrint = "Event: \(event.rawValue)"
        if let title = title {
            toPrint.append("\nTitle: \(title)")
        }
        if let message = message {
            toPrint.append("\nMessage: \"\(message)\"")
        }
        
        print(toPrint)
    }
    
}

enum AppError {
    case auth(String)
    case network(String)
    case location(String)
    case unknow
}

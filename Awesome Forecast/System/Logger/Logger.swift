//
//  Logger.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 29/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

enum LogEvent: String {
    case open = "Open"
    case pressButton = "Press button"
    case success = "Success"
    case fail = "Fail"
}

protocol Logger {
    static func log(event: LogEvent, title: String?, message: String?)
}

class ConsoleLogger: Logger {
    
    static func log(event: LogEvent, title: String?, message: String? = nil) {
        var toPrint = String(format: NSLocalizedString("Logger.Event_%@", comment: ""), event.rawValue)
        if let title = title {
            toPrint.append("\n")
            toPrint.append(String(format: NSLocalizedString("Logger.Title_%@", comment: ""), title))
        }
        if let message = message {
            toPrint.append("\n")
            toPrint.append(String(format: NSLocalizedString("Logger.Message_%@", comment: ""), message))
        }
        
        print(toPrint)
    }
    
}

//
//  WeeklyTableViewCell.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

protocol Identifieble {
    static var identifier: String { get }
}

class WeeklyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    func updateWithItem(_ item: WeeklyCellModel) {
        dateLabel.text = item.date
        dayOfWeekLabel.text = item.dayOfWeek
        temperatureLabel.text = item.temperature
        weatherIconImageView.image = item.weatherType.getImage(isDependOnTime: false)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension WeeklyTableViewCell: Identifieble {
    
    static var identifier: String {
        return String(describing: WeeklyTableViewCell.self)
    }
    
}

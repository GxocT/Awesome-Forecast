//
//  TodayViewController.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class TodayViewController: BaseViewController {
    
    var presenter: TodayViewToPresenterProtocol!
    
    @IBOutlet weak var locationInfoLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var windInfoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showThrobber(backgroundColor: view.backgroundColor ?? .lightGray)
        presenter.updateView()
    }
    
}

extension TodayViewController: TodayPresenterToViewProtocol {
    
    func showWeather(locationInfo: String, temperature: String, details: String, wind: String) {
        hideThrobber()
        
        locationInfoLabel.text = locationInfo
        temperatureLabel.text = temperature
        weatherDescriptionLabel.text = details
        windInfoLabel.text = wind
    }
    
    func showError(_ description: String) {
        hideThrobber()
        
        // TODO: Прикрутить показ ошибки
        print("Error: \(description)")
    }
    
}

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = AppearanceManager.shared.backgroundColor
    }
}

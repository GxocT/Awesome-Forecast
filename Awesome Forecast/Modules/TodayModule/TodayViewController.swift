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
    @IBOutlet weak var windTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showThrobber()
        presenter.updateView()
    }
    
}

extension TodayViewController: TodayPresenterToViewProtocol {
    
    func showWeather(viewModel: TodayViewModel) {
        hideError()
        hideThrobber()
        
        locationInfoLabel.text = viewModel.locationInfo
        temperatureLabel.text = viewModel.temperature
        weatherDescriptionLabel.text = viewModel.details
        weatherIconImageView.image = viewModel.weatherIcon
        windInfoLabel.text = viewModel.windInfo
        windTitle.isHidden = viewModel.windInfo == nil
    }
    
    func showError(_ description: String) {
        hideThrobber()
        
        showError(description) { [weak self] in
            self?.showThrobber()
            self?.presenter.updateView()
        }
    }
    
}

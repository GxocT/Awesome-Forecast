//
//  WeeklyViewController.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class WeeklyViewController: BaseViewController {
    
    var presenter: WeeklyViewToPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cellItems: [WeeklyCellModel] = []
    private var locationInfo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showThrobber()
        presenter.updateView()
    }
    
}

extension WeeklyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyTableViewCell.identifier, for: indexPath) as? WeeklyTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateWithItem(cellItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = WeelkyTableViewHeader.instanceFromNib()
        header.title = locationInfo
        header.bgColor = view.backgroundColor
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(170)
    }
    
}

extension WeeklyViewController: WeeklyPresenterToViewProtocol {
    
    func showWeather(items: [WeeklyCellModel], locationInfo: String) {
        hideError()
        cellItems = items
        self.locationInfo = locationInfo
        tableView.reloadData()
        hideThrobber()
    }
    
    func showError(_ description: String) {
        hideError()
        hideThrobber()
        
        showError(description) { [weak self] in
            self?.showThrobber()
            self?.presenter.updateView()
        }
    }
    
}


//
//  WeeklyViewController.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class WeeklyViewController: UIViewController {
    
    var presenter: WeeklyViewToPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cellItems: [WeeklyCellItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.register(WeeklyTableViewCell.self, forCellReuseIdentifier: WeeklyTableViewCell.identifier)
        
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
    
}

extension WeeklyViewController: WeeklyPresenterToViewProtocol {
    
    func showWeather(_ items: [WeeklyCellItem]) {
        cellItems = items
        tableView.reloadData()
    }
    
    func showError(_ description: String) {
        
    }
    
}

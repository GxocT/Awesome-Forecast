//
//  BaseViewController.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 29/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConsoleLogger.log(event: .open, title: NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = AppearanceManager.shared.backgroundColor
    }
}

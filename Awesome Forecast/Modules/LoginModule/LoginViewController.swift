//
//  LoginViewController.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginViewToPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        presenter.didTapLogin()
    }
    
}

extension LoginViewController: LoginPresenterToViewProtocol {
    
    func showError(_ description: String) {
        
    }
    
}

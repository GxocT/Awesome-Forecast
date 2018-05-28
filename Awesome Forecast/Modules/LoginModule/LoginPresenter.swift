//
//  LoginPresenter.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginPresenterToViewProtocol!
    var interector: LoginPresenterToInterectorProtocol!
    var router: LoginPresenterToRouterProtocol!
    
}

extension LoginPresenter: LoginViewToPresenterProtocol {
    
    func didTapLogin() {
        interector.tryToLogin()
    }
    
    func didTapGuest() {
        router.openGuestScreen()
    }
    
}

extension LoginPresenter: LoginInterectorToPresenterProtocol {
    
    func didLoginSuccessfully() {
        router.openAuthorizedScreen()
    }
    
    func didFailWithError(_ description: String) {
        view.showError(description)
    }
    
}

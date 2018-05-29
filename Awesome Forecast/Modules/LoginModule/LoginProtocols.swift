//
//  LoginProtocols.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

protocol LoginViewToPresenterProtocol: class {
    func didTapLogin()
    func didTapGuest()
}

protocol LoginPresenterToViewProtocol: class {
    func showError(_ description: String)
}

protocol LoginPresenterToInterectorProtocol: class {
    func tryToLogin()
}

protocol LoginInterectorToPresenterProtocol: class {
    func didLoginSuccessfully()
    func didFailWithError(_ error: AppError)
}

protocol LoginPresenterToRouterProtocol: class {
    func openAuthorizedScreen()
    func openGuestScreen()
}

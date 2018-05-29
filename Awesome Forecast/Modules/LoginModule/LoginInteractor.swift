//
//  LoginInteractor.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class LoginInteractor {
    
    weak var presenter: LoginInterectorToPresenterProtocol!
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
}

extension LoginInteractor: LoginPresenterToInterectorProtocol {
    
    func tryToLogin() {
        authService.login { (result) in
            switch result {
            case .success(_):
                self.presenter.didLoginSuccessfully()
            case .error(let err):
                self.presenter.didFailWithError(err)
            }
        }
    }

}

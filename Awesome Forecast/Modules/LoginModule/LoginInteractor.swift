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
    
}

extension LoginInteractor: LoginPresenterToInterectorProtocol {
    
    func tryToLogin() {
        let login = FBSDKLoginManager()
        login.logIn(withReadPermissions: ["public_profile"],from: nil) { [weak self] (result, error) in
            guard let result = result else {
                var description = "Unknown error"
                if let error = error {
                    description = "Error: \(error.localizedDescription)"
                }
                self?.presenter.didFailWithError(description)
                return
            }
            
            if result.isCancelled {
                print("Cancelled")
            } else {
                self?.presenter.didLoginSuccessfully()
            }
        }
    }

}

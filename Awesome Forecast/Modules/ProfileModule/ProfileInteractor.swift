//
//  ProfileInteractor.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class ProfileInteractor {
    
    weak var presenter: ProfileInterectorToPresenterProtocol!
    
    private var authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    private func processError(_ error: Error?) {
        var description = "Unknown error."
        if let error = error {
            description = error.localizedDescription
        }
        presenter.didFailedWihtError(description)
    }
    
    private func processResult(_ profile: FBSDKProfile) {
        presenter.didLoadProfileSuccessfully(name: profile.name, id: profile.userID)
    }
    
}

extension ProfileInteractor: ProfilePresenterToInterectorProtocol {
    
    func loadProfile() {
        FBSDKProfile.loadCurrentProfile { [weak self] (profile, error) in
            guard let profile = profile else {
                self?.processError(error)
                return
            }
            
            self?.processResult(profile)
        }
    }
    
    func logout() {
        authService.logout()
        presenter.didLogout()
    }

}

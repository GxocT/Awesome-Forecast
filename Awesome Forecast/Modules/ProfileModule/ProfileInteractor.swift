//
//  ProfileInteractor.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class ProfileInteractor {
    
    weak var presenter: ProfileInterectorToPresenterProtocol!
    
    private var authService: AuthService
    private var profileService: ProfileService
    
    init(authService: AuthService, profileService: ProfileService) {
        self.authService = authService
        self.profileService = profileService
    }
    
}

extension ProfileInteractor: ProfilePresenterToInterectorProtocol {
    
    func loadProfile() {
        profileService.loadProfileInfo { [weak self] (result) in
            switch result {
            case .success(let profile):
                self?.presenter.didLoadProfileSuccessfully(profile)
            case .error(let err):
                self?.presenter.didFailedWihtError(err)
            }
        }
    }
    
    func logout() {
        authService.logout()
        presenter.didLogout()
    }

}

//
//  ProfilePresenter.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

class ProfilePresenter {
    
    weak var view: ProfilePresenterToViewProtocol!
    var interector: ProfilePresenterToInterectorProtocol!
    var router: ProfilePresenterToRouterProtocol!
    
}

extension ProfilePresenter: ProfileViewToPresenterProtocol {
    
    func updateView() {
        interector.loadProfile()
    }
    
    func didTapLogout() {
        interector.logout()
    }
    
}

extension ProfilePresenter: ProfileInterectorToPresenterProtocol {
    
    func didLoadProfileSuccessfully(name: String, id: String) {
        view.showProfile(name: name, id: id)
    }
    
    func didFailedWihtError(_ description: String) {
        view.showError(description)
    }
    
    func didLogout() {
        router.openLoginScreen()
    }
    
}

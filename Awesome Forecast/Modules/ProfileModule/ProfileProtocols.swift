//
//  ProfileProtocols.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

protocol ProfileViewToPresenterProtocol: class {
    func updateView()
    func didTapLogout()
}

protocol ProfilePresenterToViewProtocol: class {
    func showProfile(name: String, id: String)
    func showError(_ description: String)
}

protocol ProfilePresenterToInterectorProtocol: class {
    func loadProfile()
}

protocol ProfileInterectorToPresenterProtocol: class {
    func didLoadProfileSuccessfully(name: String, id: String)
    func didFailedWihtError(_ description: String)
}

protocol ProfilePresenterToRouterProtocol: class {
    func openLoginScreen()
}

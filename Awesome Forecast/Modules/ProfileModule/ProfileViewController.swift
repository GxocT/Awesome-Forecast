//
//  ProfileViewController.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 28/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class ProfileViewController: BaseViewController {
    
    var presenter: ProfileViewToPresenterProtocol!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: FBSDKProfilePictureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showThrobber()
        presenter.updateView()
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        presenter.didTapLogout()
    }
    
}

extension ProfileViewController: ProfilePresenterToViewProtocol {
    
    func showProfile(name: String, id: String) {
        hideThrobber()
        
        nameLabel.text = name
        profileImageView.profileID = id
    }
    
    func showError(_ description: String) {
        print("Error: \(description)")
    }
    
}

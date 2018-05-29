//
//  FacebookAuthService.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 29/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class FacebookAuthService: AuthService {
    
    private let loginManager = FBSDKLoginManager()
    
    func login(completion: @escaping (AuthService.AuthResult) -> ()) {
        loginManager.logIn(withReadPermissions: ["public_profile"],from: nil) { (result, error) in
            let title = NSLocalizedString("Log_title.Authorization", comment: "")
            guard let result = result else {
                var description = NSLocalizedString("Error.Unknown", comment: "")
                if let error = error {
                    description = error.localizedDescription
                }
                
                ConsoleLogger.log(event: .fail, title: title, message: description)
                completion(AuthResult.error(.auth(description)))
                return
            }
            
            if result.isCancelled {
                ConsoleLogger.log(event: .fail, title: title, message: NSLocalizedString("Common.Cancelled", comment: ""))
            } else {
                ConsoleLogger.log(event: .success, title: title)
                completion(AuthResult.success(""))
            }
        }
    }
    
    func logout() {
        loginManager.logOut()
    }
    
    
    var isAuthorized: Bool {
        return FBSDKAccessToken.current() != nil
    }
}

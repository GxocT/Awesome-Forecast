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
            guard let result = result else {
                var description = "Unknown error"
                if let error = error {
                    description = "Error: \(error.localizedDescription)"
                }
                
                completion(AuthResult.error(description))
                return
            }
            
            if result.isCancelled {
                print("Cancelled")
            } else {
                completion(AuthResult.success("Success"))
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

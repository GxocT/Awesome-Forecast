//
//  ProfileService.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 29/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class ProfileService {
    
    func loadProfileInfo(completion: @escaping (ResponseResult<Profile>) -> ()) {
        FBSDKProfile.loadCurrentProfile { (profile, error) in
            guard let profile = profile else {
                var description = "Unknown error."
                if let error = error {
                    description = error.localizedDescription
                }
                ConsoleLogger.log(event: .fail, title: "Profile", message: description)
                completion(.error(.network(description)))
                return
            }
            
            let plainProfile = Profile(id: profile.userID, name: profile.name)
            completion(.success(plainProfile))
        }
    }
    
}

//
//  AuthService.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 29/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation

protocol AuthService {
    typealias AuthResult = ResponseResult<Any>
    
    func login(completion: @escaping (AuthResult) -> ())
    func logout()
    
    var isAuthorized: Bool { get }
}

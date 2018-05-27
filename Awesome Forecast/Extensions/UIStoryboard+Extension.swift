//
//  UIStoryboard+Extension.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(type: T.Type) -> T {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Fail to instantiate to \(String(describing: T.self))")
        }
        return viewController
    }
    
}

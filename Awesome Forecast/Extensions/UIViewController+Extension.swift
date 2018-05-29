//
//  UIViewController+Extension.swift
//  HotelsClient
//
//  Created by Sergey Bendak on 09/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showThrobber(backgroundColor: UIColor? = nil) {
        guard !view.hasSubviewOfType(ThrobberView.self) else { return }
        
        let throbberView = ThrobberView()
        if let bgColor = backgroundColor {
            throbberView.backgroundColor = bgColor
        } else {
            throbberView.backgroundColor = view.backgroundColor
        }
        throbberView.start()
        view.addSubview(throbberView)
        throbberView.fillSuperview()
    }
    
    func hideThrobber() {
        guard view.hasSubviewOfType(ThrobberView.self) else { return }
        
        view.removeSubviewsOfType(ThrobberView.self)
    }
    
    func showError(_ description: String, backgroundColor: UIColor? = nil, updateClosure: VoidClosure?) {
        guard !view.hasSubviewOfType(ErrorView.self) else { return }
        
        let errorView = ErrorView()
        errorView.errorDescription = description
        errorView.updateClosure = updateClosure
        if let bgColor = backgroundColor {
            errorView.backgroundColor = bgColor
        } else {
            errorView.backgroundColor = view.backgroundColor
        }
        
        view.addSubview(errorView)
        errorView.fillSuperview()
    }
    
    func hideError() {
        guard view.hasSubviewOfType(ErrorView.self) else { return }
        
        view.removeSubviewsOfType(ErrorView.self)
    }
    
}

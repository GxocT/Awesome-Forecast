//
//  UIViewController+Extension.swift
//  HotelsClient
//
//  Created by Sergey Bendak on 09/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showThrobber(backgroundColor: UIColor = .clear) {
        guard !view.hasSubviewOfType(ThrobberView.self) else { return }
        
        let throbberView = ThrobberView()
        throbberView.backgroundColor = backgroundColor
        throbberView.start()
        view.addSubview(throbberView)
        throbberView.fillSuperview()
    }
    
    func hideThrobber() {
        guard view.hasSubviewOfType(ThrobberView.self) else { return }
        
        view.removeSubviewsOfType(ThrobberView.self)
    }
    
    func showError(_ description: String, updateClosure: VoidClosure?) {
        guard !view.hasSubviewOfType(ErrorView.self) else { return }
        
        let errorView = ErrorView()
        errorView.errorDescription = description
        errorView.updateClosure = updateClosure
        
        view.addSubview(errorView)
        errorView.fillSuperview()
    }
    
    func hideError() {
        guard view.hasSubviewOfType(ErrorView.self) else { return }
        
        view.removeSubviewsOfType(ErrorView.self)
    }
    
}

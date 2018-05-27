//
//  ThrobberView.swift
//  HotelsClient
//
//  Created by Sergey Bendak on 09/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ThrobberView: UIView {
    
    private var activityIndivator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func start() {
        activityIndivator.startAnimating()
    }
    
    func stop() {
        activityIndivator.stopAnimating()
    }
    
    private func setup() {
        activityIndivator  = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        addSubview(activityIndivator)
        activityIndivator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndivator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndivator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

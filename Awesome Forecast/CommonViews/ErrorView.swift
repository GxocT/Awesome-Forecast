//
//  ErrorView.swift
//  HotelsClient
//
//  Created by Sergey Bendak on 19/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    
    var errorDescription: String? {
        get {
            return textLabel.text
        }
        
        set {
            textLabel.text = newValue
        }
    }
    
    var updateClosure: VoidClosure?
    
    private var container: UIView!
    private var textLabel: UILabel!
    private var updateButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        createViews()
        layoutViews()
    }
    
    private func createViews() {
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)
        
        textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.textColor = .darkGray
        textLabel.font = UIFont.systemFont(ofSize: 15)
        container.addSubview(textLabel)
        
        updateButton = UIButton()
        updateButton.setTitle("Update", for: .normal)
        updateButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        updateButton.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        updateButton.addTarget(self, action: #selector(updateAction), for: .touchUpInside)
        container.addSubview(updateButton)
    }
    
    private func layoutViews() {
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, margins: .init(top: 0, left: 30, bottom: 0, right: 30))
        
        textLabel.anchor(top: container.topAnchor, leading: container.leadingAnchor, bottom: nil, trailing: container.trailingAnchor)
        
        updateButton.anchor(top: textLabel.bottomAnchor, leading: container.leadingAnchor, bottom: container.bottomAnchor, trailing: container.trailingAnchor, margins: .init(top: 4, left: 0, bottom: 0, right: 0))
    }
    
    @objc private func updateAction() {
        updateClosure?()
    }
}

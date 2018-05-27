//
//  WeelkyTableViewHeader.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 27/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class WeelkyTableViewHeader: UITableViewHeaderFooterView {
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var bgColor: UIColor? {
        didSet {
            backgroundView?.backgroundColor = bgColor
        }
    }
    
    private let titleLabel: UILabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        backgroundView = UIView(frame: contentView.bounds)
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.systemFont(ofSize: 72, weight: .thin)
        titleLabel.textColor = .white
        titleLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, margins: .init(top: 0, left: 30, bottom: 0, right: 30))
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
    
}

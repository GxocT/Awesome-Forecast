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
    
    @IBOutlet private var titleLabel: UILabel!
    
    class func instanceFromNib() -> WeelkyTableViewHeader {
        return UINib(nibName: "WeelkyTableViewHeader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! WeelkyTableViewHeader
    }
    
}

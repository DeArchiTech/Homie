//
//  marketItemCell.swift
//  Homie
//
//  Created by davix on 10/15/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class MarketItemCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
//
//  EventItemCell.swift
//  Homie
//
//  Created by davix on 10/15/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class EventItemCell: UITableViewCell {
    
    @IBOutlet weak var eventUIView: EventUIView!
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
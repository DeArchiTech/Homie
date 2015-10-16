//
//  EventUIView.swift
//  Homie
//
//  Created by davix on 10/15/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class EventUIView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
}
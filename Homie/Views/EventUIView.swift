//
//  EventUIView.swift
//  Homie
//
//  Created by davix on 10/15/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class EventUIView: UIView {
    
    var view: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect){
        // properties
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder : aDecoder)
        view = loadViewFromNib()
        addSubview(view)
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "EventUIView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options:nil)[0] as! UIView
        return view
        
    }
    
}
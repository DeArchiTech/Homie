//
//  AlertHelper.swift
//  Homie
//
//  Created by davix on 10/23/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper : NSObject{

    func createAlertController(action: String , success : Bool) -> UIAlertController{
        
        var title = "Failure"
        var message = action + " failed"
        
        if success {
            
            title = "Succeeded"
            message = action + " Succeeded"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        return alertController
        
    }
    
}
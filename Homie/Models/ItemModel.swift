//
//  ItemModel.swift
//  Homie
//
//  Created by davix on 10/9/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

class ItemModel : DetailItemViewModel{
    
    var name: String?
    var description: String?
    var photos : [String]?
    var lattitude : Double?
    var longitute : Double?
    var pickUpPrice : Double?
    var deliveryPrice : Double?
    
    func getSellerProfileImage() -> String{
        
        return ""
        
    }
    
    func getItemImage() -> String{
        
        return ""
        
    }
    
    func getDistrictName() -> String{
        
        return ""
        
    }
    
    func getItemName() -> String{
        
        return ""
        
    }
    
    func getItemDescription() -> String{
        
        return ""
        
    }
    
    func getPickUpPrice() -> String{
        
        return ""
        
    }
    
    func getDeliveryPrice() -> String{
        
        return ""
        
    }
}